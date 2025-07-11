using Discord;
using Discord.WebSocket;
using System.Timers;

public class GameStatusUpdater
{
    private System.Timers.Timer? updateTimer;
    private DiscordSocketClient? client;
    private const int UPDATE_INTERVAL_SECONDS = 60; // Update every 60 seconds - change this for different intervals

    public void StartGameStatusUpdates(DiscordSocketClient _client)
    {
        client = _client;
        
        // Create timer that fires with high precision
        updateTimer = new System.Timers.Timer(UPDATE_INTERVAL_SECONDS * 1000); // Convert seconds to milliseconds
        updateTimer.Elapsed += OnUpdateTimerElapsed;
        updateTimer.AutoReset = true;
        updateTimer.Enabled = true; // More reliable than Start()
        
        // Immediate first update, then every 60 seconds
        _ = Task.Run(async () => {
            await Task.Delay(1000); // Wait 1 second for bot to fully initialize
            await UpdateGameStatus(); // First immediate update
        });

        Log.WriteLine($"Game status updater started - will update immediately, then every {UPDATE_INTERVAL_SECONDS} seconds", LogLevel.DEBUG);
    }

    private async void OnUpdateTimerElapsed(object? sender, ElapsedEventArgs e)
    {
        try
        {
            Log.WriteLine($"Timer elapsed - starting update at {DateTime.Now:HH:mm:ss}", LogLevel.DEBUG);
            await UpdateGameStatus();
            Log.WriteLine($"Update completed at {DateTime.Now:HH:mm:ss}", LogLevel.DEBUG);
        }
        catch (Exception ex)
        {
            Log.WriteLine($"Error in game status update: {ex.Message}", LogLevel.ERROR);
        }
    }

    private async Task UpdateGameStatus()
    {
        if (client == null)
        {
            Log.WriteLine("Client is null, cannot update game status", LogLevel.ERROR);
            return;
        }

        var gameStatusChannelId = Preferences.Instance.GameStatusChannelID;
        var gameStatusMessageId = Preferences.Instance.GameStatusMessageID;
        
        if (gameStatusChannelId == null)
        {
            Log.WriteLine("No game status channel configured, skipping update", LogLevel.DEBUG);
            return;
        }

        var guild = client.GetGuild(Preferences.Instance.GuildID);
        if (guild == null)
        {
            Log.WriteLine("Guild not found, cannot update game status", LogLevel.ERROR);
            return;
        }

        var channel = guild.GetChannel(gameStatusChannelId.Value) as IMessageChannel;
        if (channel == null)
        {
            Log.WriteLine($"Game status channel {gameStatusChannelId} not found", LogLevel.ERROR);
            return;
        }

        // Always load the latest game data from file
        GameData.Instance = GameData.LoadFromFile();

        // Create the updated game status embed
        var embed = CreateGameStatusEmbed();
        
        try
        {
            // Update channel name first
            var newChannelName = GameData.Instance.GetGameMapAndPlayerCountWithEmojiForChannelName();
            await guild.GetChannel(gameStatusChannelId.Value).ModifyAsync(ch => ch.Name = newChannelName);
            Log.WriteLine($"Channel name updated to: {newChannelName}", LogLevel.DEBUG);

            // Update bot status
            if (client != null)
            {
                await client.SetGameAsync(newChannelName, null, ActivityType.Playing);
                Log.WriteLine($"Bot status updated to: {newChannelName}", LogLevel.DEBUG);
            }
            
            // Try to get and modify the existing message, or create a new one if it doesn't exist
            if (gameStatusMessageId.HasValue)
            {
                var existingMessage = await channel.GetMessageAsync(gameStatusMessageId.Value);
                if (existingMessage is IUserMessage userMessage)
                {
                    await userMessage.ModifyAsync(msg => msg.Embed = embed);
                    Log.WriteLine($"Game status message {gameStatusMessageId} updated in channel {gameStatusChannelId}", LogLevel.DEBUG);
                }
                else
                {
                    Log.WriteLine($"Could not find message {gameStatusMessageId}, it may have been deleted. Creating new message.", LogLevel.WARNING);
                    // Message doesn't exist anymore, create a new one
                    await CreateNewStatusMessage(channel, embed, gameStatusChannelId.Value);
                }
            }
            else
            {
                Log.WriteLine("No game status message ID configured, creating new message", LogLevel.DEBUG);
                // No message ID set, create a new message
                await CreateNewStatusMessage(channel, embed, gameStatusChannelId.Value);
            }
        }
        catch (Exception ex)
        {
            Log.WriteLine($"Failed to update game status message: {ex.Message}", LogLevel.ERROR);
            // If message update fails, reset the message ID so a new one can be created next time
            Preferences.Instance.GameStatusMessageID = null;
            Preferences.SaveToFile();
        }
    }

    private async Task CreateNewStatusMessage(IMessageChannel channel, Embed embed, ulong channelId)
    {
        try
        {
            // Clean up old status messages from this bot to prevent duplicates
            await CleanupOldStatusMessages(channel);
            
            var newMessage = await channel.SendMessageAsync(embed: embed);
            
            Log.WriteLine($"New status message created with ID: {newMessage.Id}", LogLevel.DEBUG);
            
            // Save the new message ID for future updates
            Preferences.Instance.GameStatusMessageID = newMessage.Id;
            Preferences.SaveToFile();
            
            Log.WriteLine($"New game status message {newMessage.Id} created in channel {channelId}", LogLevel.DEBUG);
        }
        catch (Exception ex)
        {
            Log.WriteLine($"Failed to create new status message: {ex.Message}", LogLevel.ERROR);
            // Reset the message ID so we can try again next time
            Preferences.Instance.GameStatusMessageID = null;
            Preferences.SaveToFile();
        }
    }

    private async Task CleanupOldStatusMessages(IMessageChannel channel)
    {
        try
        {
            var botId = client?.CurrentUser?.Id;
            if (botId == null) return;

            // Get recent messages from this channel
            var messages = await channel.GetMessagesAsync(50).FlattenAsync();
            
            // Find messages from this bot that look like status messages
            var botStatusMessages = messages.Where(m => 
                m.Author.Id == botId && 
                m.Embeds.Any(e => 
                    e.Title?.Contains("Chernarus", StringComparison.OrdinalIgnoreCase) == true ||
                    e.Title?.Contains("Takistan", StringComparison.OrdinalIgnoreCase) == true ||
                    e.Description?.Contains("Score:", StringComparison.OrdinalIgnoreCase) == true
                )
            ).ToList();

            // Delete old status messages (keep only the most recent one if any)
            if (botStatusMessages.Count > 1)
            {
                var messagesToDelete = botStatusMessages.Skip(1); // Keep the newest, delete the rest
                foreach (var oldMessage in messagesToDelete)
                {
                    try
                    {
                        await oldMessage.DeleteAsync();
                        Log.WriteLine($"Deleted old status message {oldMessage.Id}", LogLevel.DEBUG);
                    }
                    catch (Exception ex)
                    {
                        Log.WriteLine($"Failed to delete old message {oldMessage.Id}: {ex.Message}", LogLevel.WARNING);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Log.WriteLine($"Error during cleanup of old status messages: {ex.Message}", LogLevel.WARNING);
        }
    }

    private Embed CreateGameStatusEmbed()
    {
        var gsm = new GameStatusMessage();
        gsm.GenerateMessage();

        var embedBuilder = new EmbedBuilder()
            .WithTitle(gsm.MessageEmbedTitle)
            .WithDescription(gsm.MessageDescription)
            .WithColor(gsm.MessageEmbedColor)
            .WithFooter(gsm.GenerateMessageFooter())
            .WithTimestamp(DateTimeOffset.UtcNow);

        return embedBuilder.Build();
    }

    public void StopGameStatusUpdates()
    {
        if (updateTimer != null)
        {
            updateTimer.Stop();
            updateTimer.Dispose();
            updateTimer = null;
        }

        Log.WriteLine("Game status updater stopped", LogLevel.DEBUG);
    }
} 
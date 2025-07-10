using Discord;
using Discord.WebSocket;
using System.Timers;

public class GameStatusUpdater
{
    private System.Timers.Timer? updateTimer;
    private DiscordSocketClient? client;

    public void StartGameStatusUpdates(DiscordSocketClient _client)
    {
        client = _client;
        
        // Create timer that fires every 60 seconds
        updateTimer = new System.Timers.Timer(60000); // 60 seconds in milliseconds
        updateTimer.Elapsed += OnUpdateTimerElapsed;
        updateTimer.AutoReset = true;
        updateTimer.Start();

        Log.WriteLine("Game status updater started - will update every 60 seconds", LogLevel.DEBUG);
    }

    private async void OnUpdateTimerElapsed(object? sender, ElapsedEventArgs e)
    {
        try
        {
            await UpdateGameStatus();
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
        
        if (gameStatusChannelId == null || gameStatusMessageId == null)
        {
            Log.WriteLine("No game status channel or message configured, skipping update", LogLevel.DEBUG);
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

        // Create the updated game status embed
        var embed = CreateGameStatusEmbed();
        
        try
        {
            // Try to get and modify the existing message
            var message = await channel.GetMessageAsync(gameStatusMessageId.Value);
            if (message is IUserMessage userMessage)
            {
                await userMessage.ModifyAsync(msg => msg.Embed = embed);
                Log.WriteLine($"Game status message {gameStatusMessageId} updated in channel {gameStatusChannelId}", LogLevel.DEBUG);
            }
            else
            {
                Log.WriteLine($"Could not find message {gameStatusMessageId}, it may have been deleted", LogLevel.WARNING);
                // Message doesn't exist anymore, reset the message ID
                Preferences.Instance.GameStatusMessageID = null;
                Preferences.Instance.SaveToFile();
            }
        }
        catch (Exception ex)
        {
            Log.WriteLine($"Failed to update game status message: {ex.Message}", LogLevel.ERROR);
            // If message update fails, reset the message ID so a new one can be created
            Preferences.Instance.GameStatusMessageID = null;
            Preferences.Instance.SaveToFile();
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
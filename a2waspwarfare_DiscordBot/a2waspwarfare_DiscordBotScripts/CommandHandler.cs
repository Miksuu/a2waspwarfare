using Discord.WebSocket;
using Discord;
using System.Threading.Tasks;

public static class CommandHandler
{
    public static async Task InstallCommandsAsync()
    {
        try
        {
            Log.WriteLine("Registering /setup command.", LogLevel.DEBUG);
            var client = BotReference.GetClientRef();

            // Register the /setup command (no options, uses current channel)
            var setupCommand = new SlashCommandBuilder()
                .WithName("setup")
                .WithDescription("Set this channel as the game status update channel (authorized users only)");

            await client.Rest.CreateGuildCommand(setupCommand.Build(), Preferences.Instance.GuildID);

            client.SlashCommandExecuted += SlashCommandHandler;
            Log.WriteLine("/setup command registered.", LogLevel.DEBUG);
        }
        catch (Exception ex)
        {
            Log.WriteLine(ex.Message, LogLevel.ERROR);
            throw new InvalidOperationException(ex.Message);
        }
    }

    private static async Task SlashCommandHandler(SocketSlashCommand command)
    {
        try
        {
            Log.WriteLine($"Received slash command: {command.CommandName} from user {command.User.Id}", LogLevel.DEBUG);
            
            if (command.CommandName.ToLower() == "setup")
            {
                ulong userId = command.User.Id;
                
                Log.WriteLine($"Processing /setup command for user {userId}", LogLevel.DEBUG);
                
                if (!Preferences.Instance.IsUserAuthorized(userId))
                {
                    await command.RespondAsync("You are not authorized to use this command.", ephemeral: true);
                    Log.WriteLine($"Unauthorized user {userId} attempted to use /setup.", LogLevel.WARNING);
                    return;
                }

                Log.WriteLine("User is authorized, setting up game status channel...", LogLevel.DEBUG);

                // Set the current channel as the game status channel
                Preferences.Instance.GameStatusChannelID = command.Channel.Id;
                
                Log.WriteLine("Creating initial status message...", LogLevel.DEBUG);
                
                // Update channel name first
                var newChannelName = GameData.Instance.GetGameMapAndPlayerCountWithEmojiForChannelName();
                if (command.Channel is SocketGuildChannel guildChannel)
                {
                    await guildChannel.ModifyAsync(ch => ch.Name = newChannelName);
                    Log.WriteLine($"Channel name updated to: {newChannelName}", LogLevel.DEBUG);

                    // Update bot status
                    var client = BotReference.GetClientRef();
                    if (client != null)
                    {
                        await client.SetGameAsync(newChannelName, null, ActivityType.Playing);
                        Log.WriteLine($"Bot status updated to: {newChannelName}", LogLevel.DEBUG);
                    }
                }
                
                // Create the initial status message immediately
                var embed = CreateGameStatusEmbed();
                var message = await command.Channel.SendMessageAsync(embed: embed);
                
                Log.WriteLine($"Status message created with ID: {message.Id}", LogLevel.DEBUG);
                
                // Save the message ID for future updates
                Preferences.Instance.GameStatusMessageID = message.Id;
                Preferences.Instance.SaveToFile();
                
                Log.WriteLine("Preferences saved, sending response...", LogLevel.DEBUG);
                
                await command.RespondAsync($"This channel (<#{command.Channel.Id}>) is now set for game status updates!", ephemeral: true);
                Log.WriteLine($"Game status channel set to {command.Channel.Id} with message ID {message.Id} by user {userId}", LogLevel.DEBUG);
            }
            else
            {
                await command.RespondAsync("Unknown command.", ephemeral: true);
                Log.WriteLine($"Unknown command received: {command.CommandName}", LogLevel.WARNING);
            }
        }
        catch (Exception ex)
        {
            Log.WriteLine($"Error in SlashCommandHandler: {ex.Message}", LogLevel.ERROR);
            Log.WriteLine($"Stack trace: {ex.StackTrace}", LogLevel.ERROR);
            
            try
            {
                if (!command.HasResponded)
                {
                    await command.RespondAsync("An error occurred while processing your command. Please check the logs.", ephemeral: true);
                }
            }
            catch (Exception responseEx)
            {
                Log.WriteLine($"Failed to send error response: {responseEx.Message}", LogLevel.ERROR);
            }
        }
    }

    private static Embed CreateGameStatusEmbed()
    {
        // Always load the latest game data from file
        var latestGameData = SerializationManager.DeSerializeDatabase();
        if (latestGameData != null)
        {
            GameData.Instance = latestGameData;
        }

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
}
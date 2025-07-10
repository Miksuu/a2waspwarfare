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
        if (command.CommandName.ToLower() == "setup")
        {
            ulong userId = command.User.Id;
            if (!Preferences.Instance.IsUserAuthorized(userId))
            {
                await command.RespondAsync("You are not authorized to use this command.", ephemeral: true);
                Log.WriteLine($"Unauthorized user {userId} attempted to use /setup.", LogLevel.WARNING);
                return;
            }

            // Set the current channel as the game status channel
            Preferences.Instance.GameStatusChannelID = command.Channel.Id;
            
            // Create the initial status message immediately
            var embed = CreateGameStatusEmbed();
            var message = await command.Channel.SendMessageAsync(embed: embed);
            
            // Save the message ID for future updates
            Preferences.Instance.GameStatusMessageID = message.Id;
            Preferences.Instance.SaveToFile();
            
            await command.RespondAsync($"This channel (<#{command.Channel.Id}>) is now set for game status updates!", ephemeral: true);
            Log.WriteLine($"Game status channel set to {command.Channel.Id} with message ID {message.Id} by user {userId}", LogLevel.DEBUG);
        }
    }

    private static Embed CreateGameStatusEmbed()
    {
        var embedBuilder = new EmbedBuilder()
            .WithTitle("🎮 Game Status Update")
            .WithColor(Color.Blue)
            .WithTimestamp(DateTimeOffset.UtcNow);

        // Add game status information here
        // This is where you would integrate with your game data
        embedBuilder.AddField("Status", "🟢 Online", true);
        embedBuilder.AddField("Players", "0/100", true);
        embedBuilder.AddField("Map", "Takistan", true);
        embedBuilder.AddField("Next Update", DateTime.UtcNow.AddMinutes(1).ToString("HH:mm UTC"), true);

        return embedBuilder.Build();
    }
}
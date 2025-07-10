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

        // Create the game status message
        var embed = CreateGameStatusEmbed();
        
        try
        {
            await channel.SendMessageAsync(embed: embed);
            Log.WriteLine($"Game status updated in channel {gameStatusChannelId}", LogLevel.DEBUG);
        }
        catch (Exception ex)
        {
            Log.WriteLine($"Failed to send game status update: {ex.Message}", LogLevel.ERROR);
        }
    }

    private Embed CreateGameStatusEmbed()
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
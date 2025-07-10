using Discord;
using Discord.WebSocket;
using System.Collections.Concurrent;

public class ProgramRuntime
{
    DiscordSocketClient client;

    public async Task ProgramRuntimeTask()
    {
        LogLevelNormalization.InitLogLevelNormalizationStrings();
        // Do not use the logging system before this !!!

        // Load the data from the file
        var discordBotDatabase = SerializationManager.DeSerializeDatabase();
        if (discordBotDatabase == null)
        {
            Log.WriteLine("Failed to deserialize DiscordBotDatabase", LogLevel.ERROR);
            return;
        }
        //Database.SetInstance(discordBotDatabase);

        // Set up client and return it
        client = BotReference.SetClientRefAndReturnIt();

        // Reads token from the same directory as the .exe
        var token = File.ReadAllText("token.txt");
        await client.LoginAsync(TokenType.Bot, token);
        await client.StartAsync();

        client.Ready += async () =>
        {
            if (!BotReference.Instance.ConnectionState)
            {
                BotReference.Instance.ConnectionState = true;
                Log.WriteLine("Bot is connected!", LogLevel.DEBUG);

                await GameDataDeSerialization.DeSerializeGameDataFromExtension();

                await SetupProgramListenersAndSchedulers();

                //new GameDataUpdateEvent(eventManager.ClassScheduledEvents);
            }
            else
            {
                HandleBotReconnection();
            }
        };

        // Block this task until the program is closed.
        await Task.Delay(-1);
    }

    // private async Task SetupProgramListenersAndSchedulers()
    // {
    //     // Creates the categories and the channels from the interfaces
    //     // (dependant on the data from CreateLeaguesOnStartupIfNecessary())
    //     await CategoryAndChannelManager.CreateCategoriesAndChannelsForTheDiscordServer();

    //     // Creates the league references to the database
    //     //await LeagueManager.CreateLeaguesOnStartupIfNecessary();

    //     await SetupEventScheduler();

    //     //await SerializationManager.SerializeUsersOnTheServer();
    //     await SerializationManager.SerializeDB();

    //     SetupListeners();

    //     await CommandHandler.InstallCommandsAsync();
    // }

    // private async Task SetupEventScheduler()
    // {
    //     await Database.GetInstance<DiscordBotDatabase>().EventScheduler.CheckCurrentTimeAndExecuteScheduledEvents(true);

    //     Thread secondThread = new Thread(Database.GetInstance<DiscordBotDatabase>().EventScheduler.EventSchedulerLoop);
    //     secondThread.Start();
    // }

    private void HandleBotReconnection() 
    { 
        Log.WriteLine("Bot was already connected!", LogLevel.WARNING);

        client.ButtonExecuted -= ButtonHandler.HandleButtonPress;

        SetupListeners();
    }

    private void SetupListeners()
    {
        client.ButtonExecuted += ButtonHandler.HandleButtonPress;
    }
}
using Discord.WebSocket;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.IO;
using System.Runtime.Serialization;

public static class SerializationManager
{
    static SemaphoreSlim semaphore = new SemaphoreSlim(1);

    // The single JSON file to use for all serialization
    private static string DatabaseJsonFilePath => Path.Combine(FileConfiguration.DataSourcePath, "database.json");

    // You must provide your own instance to serialize and a way to set the deserialized instance.
    // This class now only handles reading/writing the JSON file at DatabaseJsonFilePath.

    public static async Task SerializeDB<T>(T instance)
    {
        await semaphore.WaitAsync();
        try
        {
            Log.WriteLine("SERIALIZING DB", LogLevel.SERIALIZATION);

            if (!Directory.Exists(FileConfiguration.DataSourcePath))
            {
                Directory.CreateDirectory(FileConfiguration.DataSourcePath);
            }

            try
            {
                // Set up serializer settings
                var serializerSettings = new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Include,
                    TypeNameHandling = TypeNameHandling.All,
                    Formatting = Formatting.Indented,
                    ObjectCreationHandling = ObjectCreationHandling.Replace,
                    ContractResolver = new DataMemberContractResolver()
                };
                serializerSettings.Converters.Add(new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter());

                // Serialize the provided instance to the JSON file at DatabaseJsonFilePath
                string json = JsonConvert.SerializeObject(instance, typeof(T), serializerSettings);
                File.WriteAllText(DatabaseJsonFilePath, json);
            }
            catch (Exception ex)
            {
                Log.WriteLine(ex.Message, LogLevel.ERROR);
            }
        }
        catch (Exception ex)
        {
            Log.WriteLine(ex.Message, LogLevel.ERROR);
            throw new InvalidOperationException(ex.Message);
        }
        finally
        {
            semaphore.Release();
        }
    }

    public class DataMemberContractResolver : DefaultContractResolver
    {
        protected override IList<JsonProperty> CreateProperties(Type type, MemberSerialization memberSerialization)
        {
            var properties = base.CreateProperties(type, memberSerialization);
            return properties.Where(p => p.AttributeProvider.GetAttributes(typeof(DataMemberAttribute), true).Any()).ToList();
        }
    }

    public static GameData DeSerializeDatabase()
    {
        try
        {
            Log.WriteLine("DESERIALIZING DB", LogLevel.SERIALIZATION);

            // Ensure the directory exists
            if (!Directory.Exists(FileConfiguration.DataSourcePath))
            {
                Directory.CreateDirectory(FileConfiguration.DataSourcePath);
            }

            try
            {
                if (!File.Exists(DatabaseJsonFilePath))
                {
                    Log.WriteLine("Database file not found: " + DatabaseJsonFilePath + ". Creating new database.", LogLevel.WARNING);
                    
                    // Create a new GameData instance
                    var newDatabase = new GameData();
                    
                    // Serialize it to create the file
                    SerializeDB(newDatabase).Wait();
                    
                    Log.WriteLine("Created new database file: " + DatabaseJsonFilePath, LogLevel.DEBUG);
                    return newDatabase;
                }

                string json = File.ReadAllText(DatabaseJsonFilePath);
                
                // Set up deserializer settings
                var serializerSettings = new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Include,
                    TypeNameHandling = TypeNameHandling.All,
                    ObjectCreationHandling = ObjectCreationHandling.Replace,
                    ContractResolver = new DataMemberContractResolver()
                };
                serializerSettings.Converters.Add(new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter());

                // Deserialize the JSON back to GameData
                var database = JsonConvert.DeserializeObject<GameData>(json, serializerSettings);
                
                if (database == null)
                {
                    Log.WriteLine("Failed to deserialize database from JSON. Creating new database.", LogLevel.WARNING);
                    database = new GameData();
                    SerializeDB(database).Wait();
                }
                
                return database;
            }
            catch (Exception ex)
            {
                Log.WriteLine("Error reading database file: " + ex.Message + ". Creating new database.", LogLevel.ERROR);
                
                // Create a new database if there's any error
                var newDatabase = new GameData();
                SerializeDB(newDatabase).Wait();
                return newDatabase;
            }
        }
        catch (Exception ex)
        {
            Log.WriteLine(ex.Message, LogLevel.ERROR);
            throw new InvalidOperationException(ex.Message);
        }
    }
}
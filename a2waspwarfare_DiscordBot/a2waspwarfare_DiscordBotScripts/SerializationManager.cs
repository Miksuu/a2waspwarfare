using Discord.WebSocket;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.IO;
using System.Runtime.Serialization;

public static class SerializationManager
{
    static SemaphoreSlim semaphore = new SemaphoreSlim(1);

    // The single JSON file to use for all serialization
    private static readonly string DatabaseJsonFilePath = Path.Combine(FileConfiguration.MainAppNameDataDirectory, "database.json");

    // You must provide your own instance to serialize and a way to set the deserialized instance.
    // This class now only handles reading/writing the JSON file at DatabaseJsonFilePath.

    public static async Task SerializeDB<T>(T instance)
    {
        await semaphore.WaitAsync();
        try
        {
            Log.WriteLine("SERIALIZING DB", LogLevel.SERIALIZATION);

            if (!Directory.Exists(FileConfiguration.MainAppNameDataDirectory))
            {
                Directory.CreateDirectory(FileConfiguration.MainAppNameDataDirectory);
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

    public static string DeSerializeDatabase()
    {
        try
        {
            Log.WriteLine("DESERIALIZING DB", LogLevel.SERIALIZATION);

            try
            {
                if (!File.Exists(DatabaseJsonFilePath))
                {
                    Log.WriteLine("Database file not found: " + DatabaseJsonFilePath, LogLevel.WARNING);
                    return null;
                }

                string json = File.ReadAllText(DatabaseJsonFilePath);
                return json;
            }
            catch (Exception ex)
            {
                Log.WriteLine(ex.Message, LogLevel.ERROR);
                return null;
            }
        }
        catch (Exception ex)
        {
            Log.WriteLine(ex.Message, LogLevel.ERROR);
            throw new InvalidOperationException(ex.Message);
        }
    }
}
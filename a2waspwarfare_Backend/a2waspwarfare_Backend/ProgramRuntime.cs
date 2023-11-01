using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

class ProgramRuntime
{
    private static readonly HttpClient client = new HttpClient();
    private static string backendAlias = "Skynet";
    private static ulong serverId = 19801218;
    private static string? token;

    public static async Task RunBackend()
    {
        token = await File.ReadAllTextAsync("token.txt");
        await testMethod();
    }

    public static async Task testMethod()
    {
        await SendMessage("Mr.James", $"{backendAlias}: hello james, this is {backendAlias} speaking");
    }

    private static async Task SendMessage(string _playerName, string _message)
    {
        try
        {
            var command = new
            {
                data = new
                {
                    type = "rconCommand",
                    attributes = new
                    {
                        command = "arma:privateChat",
                        options = new
                        {
                            message = $"message {_playerName} {_message}"
                        }
                    },
                    relationships = new
                    {
                        session = new
                        {
                            data = new
                            {
                                type = "session",
                                id = "" //temp
                            }
                        }
                    }
                }
            };

            string json = JsonConvert.SerializeObject(command);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await client.PostAsync($"https://api.battlemetrics.com/servers/{serverId}/command", content);

            if (!response.IsSuccessStatusCode)
            {
                string errorContent = await response.Content.ReadAsStringAsync();
                Console.WriteLine($"Error: {errorContent}");
            }

            response.EnsureSuccessStatusCode();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An error occurred: {ex.Message}");
        }
    }
}
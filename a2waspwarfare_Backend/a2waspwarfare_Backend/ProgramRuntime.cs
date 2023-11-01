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

    public static void RunBackend()
    {
        testMethod();
    }

    public static async Task testMethod()
    {
        string token = await File.ReadAllTextAsync("token.txt");
        await SendMessage(token, "Mr.James", $"{backendAlias}: hello james, this is {backendAlias} speaking");
    }

    static async Task SendMessage(string _token, string _playerName, string _message)
    {
        var command = new
        {
            data = new
            {
                type = "rconCommand",
                attributes = new
                {
                    command = "raw",
                    options = new
                    {
                        raw = $"tell {_playerName} {_message}"
                    }
                }
            }
        };

        string json = JsonConvert.SerializeObject(command);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _token);
        var response = await client.PostAsync($"https://api.battlemetrics.com/servers/{serverId}/rcon", content);

        response.EnsureSuccessStatusCode();
    }
}
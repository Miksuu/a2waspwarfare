using Discord;
using System.Data;
using System;
using System.Runtime.Serialization;
using Discord.WebSocket;
using System.Threading.Channels;
using System.Reflection;
using System.Collections.Concurrent;

[DataContract]
public class GameStatusMessage
{
    string MessageEmbedTitle = "Game Status [insert map here]";
    string MessageDescription = "Not updated yet";
    Color MessageEmbedColor = Color.Black;

    public string GenerateMessage()
    {
        MessageEmbedTitle = GameData.Instance.GetGameMapAndPlayerCountWithEmoji();
        MessageDescription = GameData.Instance.GenerateGameStatusMessage();
        ChangeMessageColorDependingOnTheCurrentWorldName();

        return MessageDescription;
    }

    public string GenerateMessageFooter()
    {
        return "Last updated at: " + DateTime.UtcNow.ToLongTimeString() + " " + DateTime.UtcNow.ToLongDateString() + " (GMT+0)";
    }

    private void ChangeMessageColorDependingOnTheCurrentWorldName()
    {
        if (GameData.Instance.GetInterfaceTerrainFromWorldName().TerrainType == TerrainType.FOREST)
        {
            MessageEmbedColor = Color.DarkGreen;
            return;
        }

        // Takistan/desert maps
        MessageEmbedColor = Color.Gold;
    }
}
﻿using Discord;
using System.Data;
using System;
using System.Runtime.Serialization;
using Discord.WebSocket;
using System.Threading.Channels;
using System.Reflection;
using System.Collections.Concurrent;

[DataContract]
public class GAMESTATUSMESSAGE : BaseMessage
{
    public GAMESTATUSMESSAGE()
    {
        thisInterfaceMessage.MessageName = MessageName.GAMESTATUSMESSAGE;

        thisInterfaceMessage.MessageButtonNamesWithAmount = new ConcurrentDictionary<ButtonName, int>(
            new ConcurrentBag<KeyValuePair<ButtonName, int>>()
            {
            });

        thisInterfaceMessage.MessageEmbedTitle = "Game Status [insert map here]";
    }

    protected override void GenerateButtons(ComponentBuilder _component, ulong _leagueCategoryId)
    {
        base.GenerateRegularButtons(_component, _leagueCategoryId);
    }

    public override Task<string> GenerateMessage(ulong _leagueCategoryId = 0)
    {
        // Get max player count here by the world name
        // Change the embed message color to green or light yellow

        // worldName as the title (add player count here)
        thisInterfaceMessage.MessageEmbedTitle = "Game Status " + "[" + GameData.Instance.exportedArgs[2] + "]";

        string message = string.Empty;

        message += "Uptime: " + GameData.Instance.exportedArgs[3] + "\n";

        message += "\n" + EnumExtensions.GetEnumMemberAttrValue(EmojiName.BLUFORICON) + " BLUFOR: " + GameData.Instance.exportedArgs[0] + "\n";
        message += EnumExtensions.GetEnumMemberAttrValue(EmojiName.OPFORICON) + " OPFOR: " + GameData.Instance.exportedArgs[1] + "\n" +
            "\nPlease balance the teams accordingly!";

        return Task.FromResult(message);
    }

    public override string GenerateMessageFooter()
    {
        return "Last updated at: " + DateTime.UtcNow.ToLongTimeString() + " " + DateTime.UtcNow.ToLongDateString() + " (GMT+0)";
    }
}
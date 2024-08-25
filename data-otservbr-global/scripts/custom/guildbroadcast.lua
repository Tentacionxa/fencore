local MESSAGE_TYPE = MESSAGE_EVENT_ADVANCE

local guildBroadcast = TalkAction("!bc")

function guildBroadcast.onSay(player, words, param)
 if player and player:getGuildLevel() and player:getGuildLevel() >= 3 then
    if param == "" then
        player:sendCancelMessage("Command param required.")
        return true
    end

    local message = player:getName() .. " broadcasted: " .. param

    local guild = player:getGuild()
    if not guild then
        player:sendCancelMessage("You need to be in a guild")
        return true
    end

    local members = guild:getMembersOnline()
    
    for _, player in ipairs(members) do
        player:sendTextMessage(MESSAGE_TYPE, message)
    end

    return true
end
end
guildBroadcast:groupType("normal")
guildBroadcast:separator(" ")
guildBroadcast:register()
local frags = TalkAction("!frags")

function frags.onSay(player, words, param)
    local query = "SELECT count(*) as result FROM `player_deaths` WHERE killed_by = '" .. player:getName() .. "'"
    local numFrags = db.storeQuery(query)
    local value = Result.getNumber(numFrags, "result")

    player:sendTextMessage(MESSAGE_LOOT, "You have killed a total of " .. value .. " players so far.") 

    return false
end

frags:separator(" ")
frags:groupType("normal")
frags:register()
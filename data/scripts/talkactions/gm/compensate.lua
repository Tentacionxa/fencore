local rewardId = 14758 -- id itemu

local reward = TalkAction("/compensate")

function reward.onSay(player, words, param)
    for _, player in pairs(Game.getPlayers()) do
        local count = 1
        if player:getLevel() >= 2500 then
            count = 5
        elseif player:getLevel() >= 2000 then
            count = 4
        elseif player:getLevel() >= 1500 then
            count = 3
        elseif player:getLevel() >= 1000 then
            count = 2
        elseif player:getLevel() >= 500 then
            count = 1
        end

        player:addItemStoreInbox(rewardId, count, true)
    end

    return true
end

reward:separator(" ")
reward:groupType("gamemaster")
reward:register()
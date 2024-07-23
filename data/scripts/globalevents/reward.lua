local exerciseCharges = 1000
local rewardStorage = 65998

local reward = TalkAction("!rewards")

function reward.onSay(player, words, param)
    if player then
        if player:getStorageValue(rewardStorage) >= os.time() then
            player:sendCancelMessage("You already collected your daily reward.")
        else
            player:setStorageValue(rewardStorage, os.time() + 24 * 60 * 60)
            player:getPosition():sendMagicEffect(CONST_ME_SMOKE)
            if player:isSorcerer() then
                player:addItem(28557, exerciseCharges)
            elseif player:isDruid() then
                player:addItem(28556, exerciseCharges)
            elseif player:isPaladin() then
                player:addItem(28555, exerciseCharges)
            elseif player:isKnight() then
                    player:addItem(28552, exerciseCharges)
                    player:addItem(28554, exerciseCharges)
                    player:addItem(28553, exerciseCharges)
           
    end
end

reward:groupType("normal")
reward:register()

local outfit = TalkAction("!outfit")

function outfit.onSay(player, words, param)    
    if player and player:getGuildLevel() and player:getGuildLevel() >= 3 then
        local outfit = player:getOutfit()
        local guild = player:getGuild()
        if not guild then
            return false
        end
        for _, targetPlayer in ipairs(guild:getMembersOnline()) do
            if targetPlayer then
                if canPlayerWearOutfit(targetPlayer, outfit.lookType, 0) then
                    targetPlayer:setOutfit({lookType = outfit.lookType, lookFeet = outfit.lookFeet, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookHead = outfit.lookHead,lookAddons = 0})
                    targetPlayer:getPosition():sendMagicEffect(CONST_ME_BATS)
                else
                    targetPlayer:setOutfit({lookType = targetPlayer:getOutfit().lookType, lookFeet = outfit.lookFeet, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookHead = outfit.lookHead,lookAddons = 0})
                    targetPlayer:getPosition():sendMagicEffect(CONST_ME_BATS)
                end
            end
        end
    end
end
outfit:groupType("normal")
outfit:register()
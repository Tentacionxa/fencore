local sleepshawl = TalkAction("!sleepshawl")

function sleepshawl.onSay(player, words, param)

    if player:getItemCount(29428) >= 1 then
        if player:removeItem(22516,1) then
            if not player:removeItem(29428, 1) then
                player:sendCancelMessage("You don't have a Sleep Shawl to repair.")
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
            end
            player:addItem(30342, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your Sleep Shawl has been repaired!")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        else
            player:sendCancelMessage("You don't have 1 Silver Token to repair Sleep Shawl.")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    else
        player:sendCancelMessage("You don't have a Sleep Shawl to repair.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return false
end
sleepshawl:groupType("normal")
sleepshawl:register()

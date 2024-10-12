local bp = TalkAction("!bp")

function bp.onSay(player, words, param)
    local exhaustGroup = "talkactions"
    local exhaustTime = 2 -- 2 seconds exhaust (you can adjust this value)

    -- Check if the player is exhausted for this command
    if player:getExhaustion(exhaustGroup) > 0 then
        player:sendCancelMessage("You are exhausted. Please wait before using this command again.")
        return false
    end

    -- Perform the action if not exhausted
    if player:removeMoneyBank(10) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(2854, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a backpack!")

        -- Set the exhaust for 2 seconds using the same logic
        player:setExhaustion(exhaustGroup, exhaustTime)
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
end

bp:groupType("normal")
bp:register()

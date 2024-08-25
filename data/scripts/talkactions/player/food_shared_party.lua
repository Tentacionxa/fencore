local food = TalkAction("!food")

function food.onSay(player, words, param)
    if player:removeMoneyBank(1000) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(3731, 100)    
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You bought food for 1k!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You don\'t have 1k.")
    end
end

food:groupType("normal")
food:register()

local shared = TalkAction("!shared")

function shared.onSay(player, words, param)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    if player then
        local text = '-- Party Info -- \n\n'
        text = text .. '-----------\n'
        text = text .. 'Min Level: ' .. math.ceil((player:getLevel() * 2) / 3) .. '  \n'
        text = text .. 'Max Level: ' .. math.ceil((player:getLevel() * player:getLevel()) / ((player:getLevel() * 2) / 3)) .. '  \n'
        text = text .. '-----------\n'
        player:showTextDialog(34266, text)
    end
    return false
end

shared:groupType("normal")
shared:register()

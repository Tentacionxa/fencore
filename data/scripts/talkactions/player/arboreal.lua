local arborealRepair = TalkAction("!arboreal")
local config = {
	wormSoftId = 39188,
	newSoftId = 39186,
	value = 75000,
}

function arborealRepair.onSay(player, words, param)
	if player:getItemCount(config.wormSoftId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormSoftId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItem(config.newSoftId, 1) -- id new spirithorn ring
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged the Charged Arboreal Ring successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:sendCancelMessage("You do not have enough money!")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have a used Arboreal Ring!")
	end
	return false
end
arborealRepair:groupType("normal")
arborealRepair:register()

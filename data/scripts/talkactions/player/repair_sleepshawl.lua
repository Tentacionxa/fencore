local sleepRepair = TalkAction("!sleepshawl")
local config = {
	wormSoftId = 29428,
	newSoftId = 30343,
	value = 75000,
}

function sleepRepair.onSay(player, words, param)
	if player:getItemCount(config.wormSoftId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormSoftId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItem(config.newSoftId, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged Your Sleep Shawl successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:sendCancelMessage("You do not have enough money!")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have a Sleep Shawl!")
	end
	return false
end
--sleepRepair:groupType("normal")
--sleepRepair:register()


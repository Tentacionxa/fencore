local theurgicRepair = TalkAction("!theurgic")
local config = {
	wormSoftId = 30401,
	newSoftId = 30403,
	value = 25000,
}

function theurgicRepair.onSay(player, words, param)
	if player:getItemCount(config.wormSoftId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormSoftId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItem(config.newSoftId, 1) -- id new soft boots
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged the Enchanted Theurgic Amulet successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:sendCancelMessage("You do not have enough money!")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have a used Enchanted Theurgic Amulet!")
	end
	return false
end
theurgicRepair:groupType("normal")
theurgicRepair:register()

local soulRepair = TalkAction("!soul")
local config = {
	wormSoftId = 32636,
	newSoftId = 32621,
	value = 75000,
}

function soulRepair.onSay(player, words, param)
	if player:getItemCount(config.wormSoftId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormSoftId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItem(config.newSoftId, 1) -- id new spirithorn ring
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged the Ring of Souls successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:sendCancelMessage("You do not have enough money!")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have a used Ring of Souls!")
	end
	return false
end
soulRepair:groupType("normal")
soulRepair:register()

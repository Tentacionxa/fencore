local fireWalkerRepair = TalkAction("!firewalkerboots")
local config = {
	wormSoftId = 9020,
	newSoftId = 9019,
	value = 12000,
}

function fireWalkerRepair.onSay(player, words, param)
	if player:getItemCount(config.wormSoftId) >= 1 then
		if player:removeMoney(config.value) or player:removeMoneyBank(config.value) then
			player:removeItem(config.wormSoftId, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addItem(config.newSoftId, 1) -- id new soft boots
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You charged firewalker boots successfully.")
		else
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			player:sendCancelMessage("You do not have enough money!")
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("You do not have worn firewalker boots!")
	end
	return false
end
fireWalkerRepair:groupType("normal")
fireWalkerRepair:register()

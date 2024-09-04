local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(38523) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(12812, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found a stamina recharger.")
	player:setStorageValue(38523, 1)
	return true
end

chest:uid(45680)
chest:register()

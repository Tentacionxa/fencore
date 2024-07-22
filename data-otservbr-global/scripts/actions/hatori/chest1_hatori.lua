local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(37001) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(43883, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found a wooden sword.")
	player:setStorageValue(37001, 1)
	return true
end

chest:aid(45671)
chest:register()

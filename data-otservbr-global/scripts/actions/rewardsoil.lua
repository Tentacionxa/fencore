local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(66533) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(943, 25)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found 25x holy soil.")
	player:setStorageValue(66533, 1)
	return true
end

chest:uid(59175)
chest:register()

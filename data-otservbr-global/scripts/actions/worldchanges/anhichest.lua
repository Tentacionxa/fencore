local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(26543) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(3388, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found a demon armor.")
	player:setStorageValue(26543, 1)
	return true
end

chest:uid(37675)
chest:register()

local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(37543) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(3288, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found a magic sword.")
	player:setStorageValue(37543, 1)
	return true
end

chest:uid(48675)
chest:register()

local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(37543) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(3319, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found an stonecutter axe.")
	player:setStorageValue(37543, 1)
	return true
end

chest:uid(36575)
chest:register()

local chest = Action()

function chest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(27743) == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		return true
	end

	player:addItem(14000, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You found an ornate shield.")
	player:setStorageValue(27743, 1)
	return true
end

chest:uid(24275)
chest:register()
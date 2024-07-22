local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 25003 then
		if player:getStorageValue(76502) <= 0 then
			player:setStorageValue(76502, 1)
			player:addItem(43864, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sanguine blade.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25004 then
			if player:getStorageValue(76502) <= 0 then
			player:setStorageValue(76502, 1)
			player:addItem(43877, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sanguine bow.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25005 then
        if player:getStorageValue(76502) <= 0 then
			player:setStorageValue(76502, 1)
			player:addItem(43885, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sanguine rod.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25006 then
        if player:getStorageValue(76502) <= 0 then
			player:setStorageValue(76502, 1)
			player:addItem(43882, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sanguine coil.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end

	return true
end

inServiceYalaharReward:uid(25003, 25004, 25005, 25006)
inServiceYalaharReward:register()

local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 25010 then
		if player:getStorageValue(25555) <= 0 then
			player:setStorageValue(25555, 1)
			player:addItem(31631, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a cobra amulet.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25011 then
			if player:getStorageValue(25555) <= 0 then
			player:setStorageValue(25555, 1)
			player:addItem(27650, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a gnome shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25012 then
        if player:getStorageValue(25555) <= 0 then
			player:setStorageValue(25555, 1)
			player:addItem(29420, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a shoulder plate.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	
	end

	return true
end

inServiceYalaharReward:uid(25010, 25011, 25012)
inServiceYalaharReward:register()

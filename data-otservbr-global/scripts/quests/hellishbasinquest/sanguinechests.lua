local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 29910 then
		if player:getStorageValue(65550) <= 0 then
			player:setStorageValue(65550, 1)
			player:addItem(43884, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sanguine boots.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 29911 then
			if player:getStorageValue(65555) <= 0 then
			player:setStorageValue(65555, 1)
			player:addItem(43881, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sanguine greaves.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 29912 then
        if player:getStorageValue(65550) <= 0 then
			player:setStorageValue(65550, 1)
			player:addItem(43887, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sanguine galoshes.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 29913 then
        if player:getStorageValue(65555) <= 0 then
			player:setStorageValue(65555, 1)
			player:addItem(43876, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have sanguine legs.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end 
	end

	return true
end

inServiceYalaharReward:uid(29910, 29911, 29912, 29913)
inServiceYalaharReward:register()

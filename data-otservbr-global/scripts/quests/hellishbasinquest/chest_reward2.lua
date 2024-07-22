local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 35050 then
		if player:getStorageValue(98551) <= 0 then
			player:setStorageValue(98551, 1)
			player:addItem(34156, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a lion spangenhelm.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 35051 then
			if player:getStorageValue(98551) <= 0 then
			player:setStorageValue(98551, 1)
			player:addItem(16109, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a prismatic helmet.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 35052 then
        if player:getStorageValue(98551) <= 0 then
			player:setStorageValue(98551, 1)
			player:addItem(16104, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a gill gugel.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 35053 then
        if player:getStorageValue(98652) <= 0 then
			player:setStorageValue(98652, 1)
			player:addItem(16110, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a prismatic armor.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 35054 then
        if player:getStorageValue(98652) <= 0 then
			player:setStorageValue(98652, 1)
			player:addItem(13994, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a depth lorica.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 35055 then
        if player:getStorageValue(98652) <= 0 then
			player:setStorageValue(98652, 1)
			player:addItem(29418, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a living armor.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 35056 then
        if player:getStorageValue(98750) <= 0 then
			player:setStorageValue(98750, 1)
			player:addItem(16111, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a prismatic legs.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end 
	elseif item.uid == 35057 then
        if player:getStorageValue(98750) <= 0 then
			player:setStorageValue(98750, 1)
			player:addItem(16106, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a gill legs.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end 
	elseif item.uid == 35058 then
        if player:getStorageValue(98750) <= 0 then
			player:setStorageValue(98750, 1)
			player:addItem(32617, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a fabulous legs.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end 
	end

	return true
end

inServiceYalaharReward:uid(35050, 35051, 35052, 35053, 35054, 35055, 35056, 35057, 35058)
inServiceYalaharReward:register()

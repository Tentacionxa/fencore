local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 38120 then
		if player:getStorageValue(99550) <= 0 then
			player:setStorageValue(99550, 1)
			player:addItem(39155, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a naga sword.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 38121 then
			if player:getStorageValue(99550) <= 0 then
			player:setStorageValue(99550, 1)
			player:addItem(39156, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a naga axe.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 38122 then
        if player:getStorageValue(99550) <= 0 then
			player:setStorageValue(99550, 1)
			player:addItem(39157, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a naga club.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 38123 then
        if player:getStorageValue(99550) <= 0 then
			player:setStorageValue(99550, 1)
			player:addItem(39159, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a naga crossbow.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 38124 then
        if player:getStorageValue(99550) <= 0 then
			player:setStorageValue(99550, 1)
			player:addItem(39160, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a naga quiver.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 38125 then
        if player:getStorageValue(99550) <= 0 then
			player:setStorageValue(99550, 1)
			player:addItem(39162, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a naga wand.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 38126 then
        if player:getStorageValue(99550) <= 0 then
			player:setStorageValue(99550, 1)
			player:addItem(39163, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a naga rod.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end 
	end

	return true
end

inServiceYalaharReward:uid(38120, 38121, 38122, 38123, 38124, 38125, 38126)
inServiceYalaharReward:register()

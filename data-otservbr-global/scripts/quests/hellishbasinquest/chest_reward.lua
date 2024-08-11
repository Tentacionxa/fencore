local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 35020 then
		if player:getStorageValue(96550) <= 0 then
			player:setStorageValue(96550, 1)
			player:addItem(43865, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a grand sanguine blade.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 35021 then
			if player:getStorageValue(96550) <= 0 then
			player:setStorageValue(96550, 1)
			player:addItem(43867, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a grand sanguine cudgel.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 35022 then
        if player:getStorageValue(96550) <= 0 then
			player:setStorageValue(96550, 1)
			player:addItem(43869, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a grand sanguine hatchet.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 35023 then
        if player:getStorageValue(96550) <= 0 then
			player:setStorageValue(96550, 1)
			player:addItem(43878, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a grand sanguine bow.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 35024 then
        if player:getStorageValue(96550) <= 0 then
			player:setStorageValue(96550, 1)
			player:addItem(43880, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a grand sanguine crossbow.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 35025 then
        if player:getStorageValue(96550) <= 0 then
			player:setStorageValue(96550, 1)
			player:addItem(43883, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a grand sanguine coil.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 35027 then
        if player:getStorageValue(96550) <= 0 then
			player:setStorageValue(96550, 1)
			player:addItem(43873, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a grand sanguine bludgeon.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 35026 then
        if player:getStorageValue(96550) <= 0 then
			player:setStorageValue(96550, 1)
			player:addItem(43886, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a grand sanguine rod.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end 
	end

	return true
end

inServiceYalaharReward:uid(35020, 35021, 35022, 35023, 35024, 35025, 35026, 35027)
inServiceYalaharReward:register()

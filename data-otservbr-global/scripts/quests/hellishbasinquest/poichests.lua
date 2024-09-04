local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 4019 then
		if player:getStorageValue(532542) <= 0 then
			player:setStorageValue(532542, 1)
			player:addItem(3341, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a arcane staff.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 4020 then
			if player:getStorageValue(532542) <= 0 then
			player:setStorageValue(532542, 1)
			player:addItem(6527, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found an avenger.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 4021 then
        if player:getStorageValue(532542) <= 0 then
			player:setStorageValue(532542, 1)
			player:addItem(5803, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found an arbalest.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 9248 then
        if player:getStorageValue(47557) <= 0 then
			player:setStorageValue(47557, 1)
			player:addItem(3549, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a pair of soft boots.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 9249 then
        if player:getStorageValue(47558) <= 0 then
			player:setStorageValue(47558, 1)
			player:addItem(5791, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a stuffed dragon.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 9250 then
        if player:getStorageValue(47559) <= 0 then
			player:setStorageValue(47559, 1)
			player:addItem(3249, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a frozen starlight.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 9251 then
        if player:getStorageValue(47560) <= 0 then
			player:setStorageValue(47560, 1)
			player:addItem(3035, 100)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found x100 platinum coins.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 9252 then
        if player:getStorageValue(47561) <= 0 then
			player:setStorageValue(47561, 1)
			player:addItem(3253, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a backpack of holding.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end 
	end

	return true
end

inServiceYalaharReward:uid(9252, 9251, 9250, 9249, 9248, 4021, 4020, 4019)
inServiceYalaharReward:register()

local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 43321 then
		if player:getStorageValue(68350) <= 0 then
			player:setStorageValue(68350, 1)
			player:addItem(3381, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a crown armor.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 43322 then
			if player:getStorageValue(68352) <= 0 then
			player:setStorageValue(68352, 1)
			player:addItem(3419, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a crown shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 43323 then
        if player:getStorageValue(69355) <= 0 then
			player:setStorageValue(69355, 1)
			player:addItem(3281, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a giant sword.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 43324 then
        if player:getStorageValue(69254) <= 0 then
			player:setStorageValue(69254, 1)
			player:addItem(3079, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found boots of haste.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 43325 then
        if player:getStorageValue(64955) <= 0 then
			player:setStorageValue(64955, 1)
			player:addItem(3428, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a tower shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 43326 then
        if player:getStorageValue(62456) <= 0 then
			player:setStorageValue(62456, 1)
			player:addItem(3387, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a demon helmet.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 43327 then
        if player:getStorageValue(66157) <= 0 then
			player:setStorageValue(66157, 1)
			player:addItem(3420, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a demon shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 43328 then
        if player:getStorageValue(60558) <= 0 then
			player:setStorageValue(60558, 1)
			player:addItem(3554, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found steel boots.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end 
	end

	return true
end

inServiceYalaharReward:uid(43321,43322,43323,43324,43325,43326,43327,43328)
inServiceYalaharReward:register()

local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 25123 then
		if player:getStorageValue(76550) <= 0 then
			player:setStorageValue(76550, 1)
			player:addItem(28717, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a falcon wand.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25017 then
			if player:getStorageValue(76550) <= 0 then
			player:setStorageValue(76550, 1)
			player:addItem(31581, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a bow of cataclysm.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25018 then
        if player:getStorageValue(76550) <= 0 then
			player:setStorageValue(76550, 1)
			player:addItem(28716, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a falcon rod.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25019 then
        if player:getStorageValue(76550) <= 0 then
			player:setStorageValue(76550, 1)
			player:addItem(28723, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a falcon longsword.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end

	return true
end

inServiceYalaharReward:uid(25123, 25017, 25018, 25019)
inServiceYalaharReward:register()

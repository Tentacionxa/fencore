local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 51050 then
		if player:getStorageValue(94351) <= 0 then
			player:setStorageValue(94351, 1)
			player:addItem(8078, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a fiery rainbow shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 51051 then
			if player:getStorageValue(94351) <= 0 then
			player:setStorageValue(94351, 1)
			player:addItem(8080, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sparking rainbow shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 51052 then
        if player:getStorageValue(94351) <= 0 then
			player:setStorageValue(94351, 1)
			player:addItem(8081, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a terran rainbow shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 51053 then
        if player:getStorageValue(94351) <= 0 then
			player:setStorageValue(94351, 1)
			player:addItem(8079, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a icy rainbow shield.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 51054 then
        if player:getStorageValue(94351) <= 0 then
			player:setStorageValue(94351, 1)
			player:addItem(22755, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a book of lies.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
    elseif item.uid == 51055 then
        if player:getStorageValue(93351) <= 0 then
			player:setStorageValue(93351, 1)
			player:addItem(21445, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a war backpack.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end

	return true
end

inServiceYalaharReward:uid(51050, 51051, 51052, 51053, 51054, 51055)
inServiceYalaharReward:register()

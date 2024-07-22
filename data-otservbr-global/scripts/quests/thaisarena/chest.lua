local config = {
    exhaustStorage = 16500, -- Storage of chest
    level = 400, -- Minimum level to open the chest
  
}

local inServiceYalaharReward = Action()
function inServiceYalaharReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.uid == 25000 then
		if player:getStorageValue(config.exhaustStorage) <= 0 then
			player:setStorageValue(config.exhaustStorage, 1)
			player:addItem(34082, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a soulcutter.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25001 then
			if player:getStorageValue(config.exhaustStorage) <= 0 then
			player:setStorageValue(config.exhaustStorage, 1)
			player:addItem(34088, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a soulbleeder.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.uid == 25002 then
        if player:getStorageValue(config.exhaustStorage) <= 0 then
			player:setStorageValue(config.exhaustStorage, 1)
			player:addItem(36672, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a eldritch folio.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end

	return true
end

inServiceYalaharReward:uid(25000, 25001, 25002)
inServiceYalaharReward:register()

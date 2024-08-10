local rewards = {
	{ id = 30399, name = "cobra rod" },
	{ id = 30400, name = "cobra wand" },
	{ id = 30395, name = "cobra club" },
	{ id = 30398, name = "cobra sword" },
	{ id = 30396, name = "cobra axe" },
	{ id = 30393, name = "cobra crossbow" },
}

feedBagId = 35479
local feedBag = Action()

function feedBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return false
	end
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received one " .. rewardItem.name .. ".")
	return true
end

feedBag:id(feedBagId)
feedBag:register()
local rewards = {
	{ id = 39156, name = "naga axe" },
	{ id = 39155, name = "naga sword" },
	{ id = 39177, name = "naga wand" },
	{ id = 39163, name = "naga rod" },
	{ id = 39159, name = "naga crossbow" },
    { id = 39157, name = "naga club" },
}

nagaBagId = 39577
local nagaBag = Action()

function nagaBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

nagaBag:id(nagaBagId)
nagaBag:register()

local rewards = {
	{ id = 28724, name = "falcon battleaxe" },
	{ id = 29425, name = "energized limb" },
	{ id = 14768, name = "thorn spitter" },
	{ id = 29417, name = "living vine bow" },
	{ id = 7450, name = "hammer of prophecy" },
	{ id = 3278, name = "magic longsword" },
}

screwsBagId = 9151
local screwsBag = Action()

function screwsBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)
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

screwsBag:id(screwsBagId)
screwsBag:register()

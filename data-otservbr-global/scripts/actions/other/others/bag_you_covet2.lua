local rewards = {
	{ id = 43887, name = "Sanguine Galoshes" },
    { id = 43865, name = "Grand Sanguine Blade" },
	{ id = 43867, name = "Grand Sanguine Cudgel" },
	{ id = 43869, name = "Grand Sanguine Hatchet" },
	{ id = 43878, name = "Grand Sanguine Bow" },
	{ id = 43880, name = "Grand Sanguine Crossbow" },
	{ id = 43883, name = "Grand Sanguine Coil" },
	{ id = 43886, name = "Grand Sanguine Rod" },
	{ id = 43873, name = "Grand Sanguine Bludgeon" },
	{ id = 43875, name = "Grand Sanguine Battleaxe" },
	{ id = 43871, name = "Grand Sanguine Razor" },
}

BagYouCovetId = 43860

local bagyouCovet = Action()

function bagyouCovet.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received a " .. rewardItem.name .. ".")
	return true
end

bagyouCovet:id(BagYouCovetId)
bagyouCovet:register()
local wallsPositions = {
	{x = 31320, y = 32044, z = 8},
	{x = 31320, y = 32043, z = 8},
    {x = 31320, y = 32042, z = 8},
    {x = 31320, y = 32041, z = 8},

}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 2773 then
		return false
	end

	for i = 1, #wallsPositions do
		local walls = Tile(wallsPositions[i]):getItemById(2184)
		if walls then
			walls:remove()
		end
	end

	item:transform(2773)
	return true
end

lever:uid(53401)
lever:register()

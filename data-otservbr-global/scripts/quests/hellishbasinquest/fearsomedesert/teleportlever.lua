local wallsPositions = {
	{x = 31440, y = 32046, z = 7},
	{x = 31440, y = 32045, z = 7},
    {x = 31440, y = 32047, z = 7},
    {x = 31440, y = 32044, z = 7},
    {x = 31440, y = 32043, z = 7},
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 21130 then
		return false
	end

	for i = 1, #wallsPositions do
		local walls = Tile(wallsPositions[i]):getItemById(20239)
		if walls then
			walls:remove()
		end
	end

	item:transform(21130)
	return true
end

lever:uid(55501)
lever:register()

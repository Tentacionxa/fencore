local wallsPositions = {
	{x = 31525, y = 32206, z = 7},
	{x = 31526, y = 32206, z = 7},

}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 21130 then
		return false
	end

	for i = 1, #wallsPositions do
		local walls = Tile(wallsPositions[i]):getItemById(20240)
		if walls then
			walls:remove()
		end
	end

	item:transform(21130)
	return true
end

lever:uid(55504)
lever:register()

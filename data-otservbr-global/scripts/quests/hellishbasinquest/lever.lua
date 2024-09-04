local wallsPositions = {
	{x = 31663, y = 31550, z = 10},
	{x = 31663, y = 31551, z = 10},
	{x = 31663, y = 31552, z = 10},
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 8912 then
		return false
	end

	for i = 1, #wallsPositions do
		local walls = Tile(wallsPositions[i]):getItemById(20239)
		if walls then
			walls:remove()
		end
	end

	item:transform(8912)
	return true
end

lever:uid(51516)
lever:register()

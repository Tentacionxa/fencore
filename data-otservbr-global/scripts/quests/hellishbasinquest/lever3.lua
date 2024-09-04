local wallsPositions = {
	{x = 31622, y = 31592, z = 10},
	{x = 31623, y = 31592, z = 10},
	{x = 31624, y = 31592, z = 10},
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 8912 then
		return false
	end

	for i = 1, #wallsPositions do
		local walls = Tile(wallsPositions[i]):getItemById(8569)
		if walls then
			walls:remove()
		end
	end

	item:transform(8912)
	return true
end

lever:uid(51518)
lever:register()

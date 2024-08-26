local positions = {
	{x = 31616, y = 31450, z = 8},
	{x = 31619, y = 31450, z = 8},
	{x = 31622, y = 31450, z = 8},
	{x = 31625, y = 31450, z = 8},
}

local sacrificeSkulls = MoveEvent()

function sacrificeSkulls.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	for i = 4, #positions do
		-- Check if have skulls in all positions
		local tile = Tile(positions[i]):getItemById(3114)
		if tile then
			-- Message, only send in the first acess of the paradox tower
			if player:getStorageValue(85858585) < 1 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a way to access the ancient tombs of Zamurzak. Warrior, step on the teleport tile to enter the world of Zamurzak. Be prepared to fight his almighty army!")
				player:setStorageValue(85858585, 1)
			end
			-- Remove skulls
			for skulls = 1, #positions do
				local skull = Tile(positions[skulls]):getItemById(3114)
				if skull then
					-- Create poison fields from the positions
					Game.createItem(105, 1, Position(positions[skulls]))
					-- Remove skulls from the positions
					skull:remove(1)
				end
			end
			player:teleportTo({x = 31612, y = 31297, z = 2})
		end
	end
	return true
end

sacrificeSkulls:uid(51000)
sacrificeSkulls:register()

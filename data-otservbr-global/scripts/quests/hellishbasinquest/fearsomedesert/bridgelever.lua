local positions = {
	{x = 31480, y = 32052, z = 7},
	{x = 31480, y = 32053, z = 7},
	{x = 31481, y = 32052, z = 7},
	{x = 31481, y = 32053, z = 7},
    {x = 31482, y = 32052, z = 7},
    {x = 31482, y = 32053, z = 7},
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 9125 then
		for i = 1, #positions do
			local tile = Tile(positions[i])
			local createBridge = tile:getItemById(4597)
			if createBridge then
				createBridge:transform(5769)
			end
		end
		player:say("<squeaak> You can hear a bridge opening to the east of the desert.", TALKTYPE_MONSTER_SAY, false, player, { x = 32107, y = 31904, z = 7 })
		item:transform(21290)
		addEvent(function(pos)
			local tile = Tile(pos)
			if tile then
				local item = tile:getItemById(21290)
				if item then
					item:transform(9125)
				end
			end
		end, 8 * 1000, item:getPosition())
end
end

lever:aid(55500)
lever:register()

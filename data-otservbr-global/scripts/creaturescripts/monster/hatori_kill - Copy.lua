local function removeTeleport(position)
	local teleportItem = Tile(position):getItemById(1949)
	if teleportItem then
		teleportItem:remove()
		position:sendMagicEffect(CONST_ME_POFF)
	end
end

local hatori = CreatureEvent("HatoriDeath")
function hatori.onDeath(creature)
	local targetMonster = creature:getMonster()
	local position = targetMonster:getPosition()
	position:sendMagicEffect(CONST_ME_TELEPORT)
	local item = Game.createItem(1949, 1, position)
	local teleportToPosition = Position(32285, 31624, 6)
	if item:isTeleport() then
		item:setDestination(teleportToPosition)
	end
	targetMonster:say("Go into teleporter! It will disappear in 30 seconds. Enter it!", TALKTYPE_MONSTER_SAY, 0, 0, position)
	--remove portal after 1 min
	addEvent(removeTeleport, 1 * 30 * 1000, position)

	--clean arena of monsters
	local spectators, spectator = Game.getSpectators(Position(32285, 31624, 7), false, false, 10, 10, 10, 10)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isMonster() then
			spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
			spectator:remove()
		end
	end
	return true
end

hatori:register()

local goPos = { x = 33313, y = 31151, z = 13 }

local asuraMirror3 = Action()
function asuraMirror3.onUse(creature, item, position, fromPosition, pos, target, toPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if player:getLevel() >= 250 then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(goPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendCancelMessage("You do not have enough level. Minimum level is 250.")
	end
	return true
end

asuraMirror3:aid(57650)
asuraMirror3:register()

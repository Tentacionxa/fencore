local goPos = { x = 33313, y = 31151, z = 13 }

local asuraMirror2 = Action()
function asuraMirror2.onUse(creature, item, position, fromPosition, pos, target, toPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if player:getLevel() >= 250 then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(33187, 31191, 7)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendCancelMessage("You do not have enough level. Minimum level is 250")
	end
	return true
end

asuraMirror2:aid(57651)
asuraMirror2:register()


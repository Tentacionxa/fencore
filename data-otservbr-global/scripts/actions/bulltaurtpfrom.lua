local bultaurtpfrom = Action()
function bultaurtpfrom.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		local destination = Position(32799, 32366, 8)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_POFF)
end

bultaurtpfrom:position({ x = 32872, y = 32368, z = 8 })
bultaurtpfrom:register()

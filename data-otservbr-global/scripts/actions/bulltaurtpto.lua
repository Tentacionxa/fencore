local bultaurtpto = Action()
function bultaurtpto.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		local destination = Position(32872, 32371, 8)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_POFF)
end

bultaurtpto:position({ x = 32799, y = 32365, z = 8 })
bultaurtpto:register()

local iksupantp = Action()
function iksupantp.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		local destination = Position(34015, 31891, 8)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_POFF)
end

iksupantp:position({ x = 32728, y = 32878, z = 7 })
iksupantp:register()

local bosstp = Action()
function bosstp.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		local destination = Position(32473, 32383, 15)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_POFF)
end

bosstp:position({ x = 32368, y = 32236, z = 6 })
bosstp:register()

local boss2tp = Action()
function boss2tp.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		local destination = Position(32473, 32383, 15)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_POFF)
end

boss2tp:position({ x = 32369, y = 32236, z = 6 })
boss2tp:register()

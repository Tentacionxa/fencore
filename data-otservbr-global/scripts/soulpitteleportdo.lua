local aidsTable = {
	[55590] = Position(32375, 31166, 8),
}

local rewardBox = Action()

function rewardBox.onUse(player, item, fromPosition, itemEx, toPosition)
	local actionIdPosition = aidsTable[item:getActionId()]
	if not actionIdPosition then
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
	player:teleportTo(actionIdPosition)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

	return true
end

rewardBox:aid(55590)
rewardBox:register()
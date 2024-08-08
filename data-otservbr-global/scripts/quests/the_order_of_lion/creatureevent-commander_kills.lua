local config = {
	centerPosition = Position(32439, 32523, 7), -- Center Room
	exitPosition = Position(32453, 32503, 7), -- Exit Position
	rangeX = 22,
	rangeY = 16,
}

local lionCommanderDeath = CreatureEvent("LionCommanderDeath")
function lionCommanderDeath.onPrepareDeath(creature)
	local totalCommanders = Game.getStorageValue(GlobalStorage.TheOrderOfTheLion.Drume.TotalLionCommanders)
	if totalCommanders > 1 then
		Game.setStorageValue(GlobalStorage.TheOrderOfTheLion.Drume.TotalLionCommanders, totalCommanders - 1)
	else
		local spectators = Game.getSpectators(config.centerPosition, false, false, config.rangeX, config.rangeX, config.rangeY, config.rangeY)
		for _, spectator in pairs(spectators) do
			if spectator:isMonster() and not spectator:getMaster() then
				spectator:remove()
			elseif spectator:isPlayer() then
				spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You lost the skirmish.")
				spectator:teleportTo(config.exitPosition)
			end
		end
		config.exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

lionCommanderDeath:register()


local kesarHealthChange = CreatureEvent("KesarImmortal")
function kesarHealthChange.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	return 0, 0, 0, 0
end

kesarHealthChange:register()

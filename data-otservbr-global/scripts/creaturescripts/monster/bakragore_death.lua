local bakragore = CreatureEvent("BakragoreDeath")

function bakragore.onDeath(creature)
	onDeathForDamagingPlayers(creature, function(creature, player)
		player:addOutfit(1663)
		player:addOutfit(1662)
	end)
	return true
end

bakragore:register()
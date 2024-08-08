local goshnar = CreatureEvent("Goshnar's Death")

function goshnar.onDeath(creature)
	onDeathForDamagingPlayers(creature, function(creature, player)
        player:setStorageValue(Storage.Quest.U12_40.SoulWar.GoshnarMegalomaniaKilled, 2)
	end)
	return true
end

goshnar:register()
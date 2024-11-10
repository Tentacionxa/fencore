local treasureChestOnDeath = CreatureEvent("TreasureChestOnDeath")

function treasureChestOnDeath.onDeath(creature)
    if not creature or not creature:isMonster() then
        return true
    end

    local monsterName = creature:getName():lower()
    if monsterName == "azel" then
        local position = creature:getPosition()
        Game.createMonster("Treasure Chest", position) -- Spawn the Treasure Chest at the same position
    end

    return true
end

treasureChestOnDeath:register()

local treasureChestOnDeath = CreatureEvent("TreasureChestOnDeath")

function treasureChestOnDeath.onDeath(creature)
    if not creature or not creature:isMonster() then
        return true
    end

    local monsterName = creature:getName():lower()
    if monsterName == "azel" then
        local position = creature:getPosition()
        local spawnedMonster = Game.createMonster("Treasure Chest", position)
        if not spawnedMonster then
            -- If spawning fails, use the fallback position
            local fallbackPosition = Position(32476, 32388, 15)
            Game.createMonster("Treasure Chest", fallbackPosition)
        end
    end

    return true
end

treasureChestOnDeath:register()

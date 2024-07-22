-- When player logs out in Zombie Arena
-- This is written just in case
-- The code should never happen
local zombieArenaLogout = CreatureEvent("ZombieArenaLogout")
function zombieArenaLogout.onLogout(player)

    -- Has the event started?
    if not zombieArena:isStarted() then
        return true
    end

    -- Did a player logout?
    if player:isPlayer() then
       
        -- Is the player doing the event?
        if not zombieArena:isPlayerOnEvent(player) then
            return true
        end
       
        player:teleportTo(player:getTown():getTemplePosition())
        zombieArena:removePlayer(player)
    end   
    return true
end

zombieArenaLogout:register()
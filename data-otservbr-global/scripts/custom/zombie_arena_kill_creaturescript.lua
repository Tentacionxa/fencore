-- When player kills a Zombie in Zombie Arena
local zombieArenaKill = CreatureEvent("ZombieArenaKill")
function zombieArenaKill.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    local player = mostdamagekiller:getPlayer()
    
    if not player then
        if mostdamagekiller:getMaster() and mostdamagekiller:getMaster():getPlayer() then
            player = mostdamagekiller:getMaster():getPlayer()
        else
            return false
        end
    end

    -- Has the event started?
    if not zombieArena:isStarted() then
        return false
    end

    -- Is the player doing the event?
    if not zombieArena:isPlayerOnEvent(player) then
        return false
    end
    
    zombieArena:onKill(player)
    return true
end
--zombieArenaKill:register()
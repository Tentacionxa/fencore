-- When player dies in Zombie Arena
local zombieArenaDeath = CreatureEvent("ZombieArenaDeath")
function zombieArenaDeath.onPrepareDeath(player, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)

    -- Has the event started?
    if not zombieArena:isStarted() then
        return false
    end

    -- Did a player die?
    if player:isPlayer() then
       
        -- Is the player doing the event?
        if not zombieArena:isPlayerOnEvent(player) then
            return false
        end

        zombieArena:removePlayer(player:getGuid())
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are dead in Zombie event!")
        
        

        zombieArena:checkArena()
        return false
    end
    return false
end

zombieArenaDeath:register()
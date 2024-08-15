
---------------------------------------------------------------------------------------
-- This script creates a portal when monster dies
---------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------
-- Config start (always write creature name in lower case for ex: "demon" not "Demon")
---------------------------------------------------------------------------------------
local portalId, t = 1949,
{
    ["burshak"] = {
        message = "The soul of burshak generated a portal to his Master! It will dissapear in 30 minutes, hurry up!",
        config = {
            createPos = {},
            toPos = {x = 31666, y = 31297, z = 4},
            portalTime = 30, --minutes
        }
    },
    ["zamurzak"] = {
        message = "The soul of zamurzak created a portal to his treasury! It will dissapear in 30 minutes, hurry up!",
        config = {
            createPos = {x = 31646, y = 31297, z = 4},
            toPos = {x = 31644, y = 31297, z = 4},
            portalTime = 30, --minutes
        }
    },
    ["hokin"] = {
        message = "The soul of hokin created a portal to zamurzak kingdom! It will dissapear in 30 minutes, hurry up!",
        config = {
            createPos = {x = 31445, y = 31510, z = 6},
            toPos = {x = 31623, y = 31469, z = 8},
            portalTime = 30, --minutes
        }
    },
    ["mordun"] = {
        message = "Killing Mordun created a teleport to his treasure! Quickly, go to the treasure room! The teleport will dissapear in 30 minutes, hurry up!",
        config = {
            createPos = {x = 31623, y = 31587, z = 10},
            toPos = {x = 31623, y = 31590, z = 10},
            portalTime = 30, --minutes
        }
    },
    ["lurok"] = {
        message = "Killing Lurok created a teleport to his castle! Quickly, go to the treasure room! The teleport will dissapear in 30 minutes",
        config = {
            createPos = {x = 31526, y = 32225, z = 7},
            toPos = {x = 31526, y = 32223, z = 7},
            portalTime = 30, --minutes
        }
    },

    ["labyrinth guard"] = {
        message = "Killing Labyrinth Guard created a teleport to the reward room! Quickly, go through the teleport! The teleport will dissapear in 60 minutes, hurry up!",
        config = {
            createPos = {x = 31762, y = 31727, z = 7},
            toPos = {x = 31762, y = 31729, z = 7},
            portalTime = 60, --minutes
        }
    },
    ["ushuriel"] = {
        message = "You now have 10 minutes to exit this room through the teleporter. It will bring you to the next room.",
        config = {
            createPos = {x = 33175, y = 31728, z = 11},
            toPos = {x = 33069, y = 31782, z = 13},
            portalTime = 10, --minutes
        }
    },
    ["zugurosh"] = {
        message = "You now have 10 minutes to exit this room through the teleporter. It will bring you to the next room.",
        config = {
            createPos = {x = 33143, y = 31692, z = 11},
            toPos = {x = 33372, y = 31613, z = 14},
            portalTime = 10, --minutes
        }
    },
    ["golgordan"] = {
        message = "You now have 10 minutes to exit this room through the teleporter. It will bring you to the next room.",
        config = {
            createPos = {x = 33232, y = 31722, z = 11},
            toPos = {x = 33038, y = 31753, z = 15},
            portalTime = 10, --minutes
        }
    },
    ["annihilon"] = {
        message = "You now have 10 minutes to exit this room through the teleporter. It will bring you to the next room.",
        config = {
            createPos = {x = 33197, y = 31687, z = 11},
            toPos = {x = 33199, y = 31686, z = 12},
            portalTime = 10, --minutes
        }
    },
    ["hellgorak"] = {
        message = "You now have 10 minutes to exit this room through the teleporter. It will bring you to the next room.",
        config = {
            createPos = {x = 33104, y = 31717, z = 11},
            toPos = {x = 33110, y = 31682, z = 12},
            portalTime = 10, --minutes
        }
    },
    ["hatori hanzo"] = {
        message = "You now have 10 minutes to exit this room through the teleporter. It will bring you to the reward room.",
        config = {
            createPos = {x = 32285, y = 31620, z = 7},
            toPos = {x = 32286, y = 31622, z = 6},
            portalTime = 10, --minutes
        }
    },
    ["furia"] = {
        message = "You now have 30 minutes to get on the other side of the island! Run warrior!",
        config = {
            createPos = {x = 33027, y = 31701, z = 4},
            toPos = {x = 33027, y = 31698, z = 4},
            portalTime = 30, --minutes
        }
    },
}
---------------------------------------------------------------------------------------
-- Config end
---------------------------------------------------------------------------------------

local function spectatorStartCountdown(time, position)
    local spectators = Game.getSpectators(position, false, false, 5, 5, 5, 5)

    if #spectators > 0 then
        for i = 1, #spectators do
            if time > 1 then
                spectators[i]:say("" .. time .. "", TALKTYPE_MONSTER_SAY, false, spectators[i], position)
            else
                spectators[i]:say("Time out!", TALKTYPE_MONSTER_SAY, false, spectators[i], position)
                break
            end
        end
    end

    local portal = Tile(position):getItemById(portalId)
    if portal then
        addEvent(spectatorStartCountdown, 1000, time - 1, position)
    end
end


local function removePortal(position)
    local portal = Tile(position):getItemById(portalId)
    if portal then
        portal:remove()
    end
end


local killMonsterCreatePortal = CreatureEvent("killMonsterCreatePortal")
function killMonsterCreatePortal.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    if not creature:isMonster() or creature:getMaster() then
        return true
    end
    
    local k = t[creature:getName():lower()]
    if not k then
        return true
    end

    local pos, cPos = creature:getPosition()
    if type(k.config.createPos) == 'table' then
        if next(k.config.createPos) == nil then
            cPos = pos
        else
            cPos = k.config.createPos
        end
    end
    
    if Tile(cPos):getItemById(portalId) then
        return true
    end

    local item = Game.createItem(portalId, 1, cPos)
    if item:isTeleport() then
        item:setDestination(k.config.toPos)
    end
    
    local pt = k.config.portalTime

    addEvent(spectatorStartCountdown, 500, pt * 60, cPos)
    addEvent(removePortal, pt * 60 * 1000, cPos)
    return true
end
killMonsterCreatePortal:register()

local callback = EventCallback()
function callback.monsterOnSpawn(monster, position)
    local k = t[monster:getName():lower()]
    if not k then
        return true
    end

    monster:registerEvent("killMonsterCreatePortal")
end
callback:register()
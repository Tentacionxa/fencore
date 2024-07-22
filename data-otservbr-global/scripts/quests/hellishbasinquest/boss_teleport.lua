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

    ["Labyrinth Guard"] = {
        message = "Killing Labyrinth Guard created a teleport to the reward room! Quickly, go through the teleport! The teleport will dissapear in 60 minutes, hurry up!",
        config = {
            createPos = {x = 31762, y = 31727, z = 7},
            toPos = {x = 31762, y = 31729, z = 7},
            portalTime = 60, --minutes
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

function killMonsterCreatePortal.onKill(creature, target)
    if not target:isMonster() or target:getMaster() then
        return true
    end
    
    local player = Player(creature:getGuid())
    local k = t[target:getName():lower()]
    if not k then
        return true
    end
    
    local pos, cPos = target:getPosition()
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

killMonsterCreatePortal:type("kill")
killMonsterCreatePortal:register()

---------------------------------------------------------------------------------------
-- Register script onLogin
---------------------------------------------------------------------------------------
local monsterKillLogin = CreatureEvent("monsterKillLogin")

function monsterKillLogin.onLogin(player)
    player:registerEvent("killMonsterCreatePortal")
    return true
end

monsterKillLogin:type("login")
monsterKillLogin:register()

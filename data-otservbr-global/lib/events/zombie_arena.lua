------------------------------------------------------
--              Zombie Arena by rwxsu               --
------------------------------------------------------
--            License: do as you please             --
------------------------------------------------------

-- Config
zombieArena = {
    config = {
        minPlayers = 1,  -- Minimum players for the event to begin
        monsters   = 10, -- Total monsters to kill
        monster    = "Event Zombie",
       
        -- Time between starts
        -- This gets called recursively until event is started
        minutesBetweenStart = 2, 

        -- How many seconds between each zombie spawned
        secondsBetweenZombies = 4,
    },
    storages  = {
        eventOpened    = 670000,
        eventStarted   = 670001,
        eventFinished  = 670002,
        monstersLeft   = 670003,
        playerOnEvent  = 670004, -- Singular
        playersOnEvent = 670005, -- Global
    },
    positions = {
        waitingRoom = {
            center = Position(31, 1136, 7),

            -- Radius is how many squares from center
            -- Do NOT count walls in radius
            radius = 10,
        },
        arena = {
            center = Position(92, 1133, 7),
            radius = 14, 
        },

        -- Where to spawn teleport to waiting room
        teleport = Position(32366, 32237, 6),
    },
    messages = {
        eventOpened   = "Zombie arena portal is now open!",
        eventStarted  = "Zombie arena event has started!",
        eventFinished = "All zombies have been slain! Zombie arena completed.",
        eventFailed   = "The zombies won by killing every single player...",
    },
    rewards = {
        [1] = {
            name   = "crystal coin",
            itemid = 3043,
            count  = 20,
        },
 [2] = {
          name   = "event coin",
           itemid = 24390,
           count  = 50,
       },

--        [2] = {
--            name   = "magic sword",
--            itemid = 2400,
--            count  = 1,
--        },
--      [3] = {
--          name   = "example item",
--          itemid = 666,
--          count  = 1,
--      },
    },
}


zombieArena.__index = zombieArena


function zombieArena:autoStart()
    local function start()
        zombieArena:start()
    end

    -- Checks if event has been started recursively,
    -- if not tries again until start
    local function check()
        if not zombieArena:isStarted() then
            zombieArena:autoStart()
        end
    end

    addEvent(start, zombieArena.config.minutesBetweenStart * 60 * 1000)
    addEvent(check, zombieArena.config.minutesBetweenStart * 60 * 1000 + 5)
end

-- Main function to start event
function zombieArena:start()
    if zombieArena:isStarted() then
        --zombieArena:debug("Event was already started.")
        return false
    end

    if not zombieArena:teleportPlayers() then
        return false
    end

    zombieArena:removeTeleport()
    zombieArena:summonMonsters()

    Game.broadcastMessage(zombieArena.messages.eventStarted, MESSAGE_STATUS_WARNING)
    Game.setStorageValue(zombieArena.storages.monstersLeft, zombieArena.config.monsters)
    Game.setStorageValue(zombieArena.storages.eventStarted, 1)
    return true
end


function zombieArena:openEvent()   
   
    if Game.getStorageValue(zombieArena.storages.eventOpened) == 1 then
        --zombieArena:debug("Event is already open.")
        return false
    end

    if zombieArena:isStarted() then
        --zombieArena:debug("Event has already started.")
        return false
    end

    -- Open event
    Game.broadcastMessage(zombieArena.messages.eventOpened, MESSAGE_STATUS_WARNING)
    Game.setStorageValue(zombieArena.storages.playersOnEvent, 0)
    Game.setStorageValue(zombieArena.storages.eventFinished, 0)
    Game.setStorageValue(zombieArena.storages.eventOpened, 1)
    --zombieArena:debug("Event opened.")
    zombieArena:createTeleport()
    return true
end


-- Creates the teleport to the waiting room
function zombieArena:createTeleport()
    local tp = Game.createItem(1949, 1, zombieArena.positions.teleport) 
    if not tp:isTeleport() then
        tp:remove()
        return false
    end

    tp:setDestination(zombieArena.positions.waitingRoom.center)
    --zombieArena:debug("Teleport created.")
    return true
end


-- Removes the teleport to the waiting room
function zombieArena:removeTeleport()

    if not Game.getStorageValue(zombieArena.storages.eventOpened) == 1 then
        --zombieArena:debug("Event is not opened.")
        return false
    end

    Game.setStorageValue(zombieArena.storages.eventOpened, 0)
    --zombieArena:debug("Event closed for new players.")

    -- Remove teleport
    local tp = Tile(zombieArena.positions.teleport)
    if tp:getItemById(1949):isTeleport() then
        tp:getItemById(1949):remove()
        --zombieArena:debug("Teleport removed.")
        return true
    end
end

function zombieArena:checkWaitingRoom()
    local center = zombieArena.positions.waitingRoom.center
    local radius = zombieArena.positions.waitingRoom.radius
    local players = Game.getSpectators(center, false, true, radius, radius, radius, radius)
   
    if #players == 0 then
        --zombieArena:debug("No players in waiting room.")
        return nil
    end

    if #players < zombieArena.config.minPlayers then
        local message = string.format("%d players required to start. Currently %d player(s) found. ", zombieArena.config.minPlayers, #players)
        zombieArena:messageGroup(players, message)
        --zombieArena:debug(message)
        return players
    end
    return players
end

function zombieArena:checkArena()
    local center = zombieArena.positions.arena.center
    local radius = zombieArena.positions.arena.radius
    local players = Game.getSpectators(center, false, true, radius, radius, radius, radius)

    if zombieArena:getPlayersLeft() == 0 then
        zombieArena:finish(false)   
        if zombieArena:clear() then
            --zombieArena:debug("All players died.")
        end
        return nil
    end
    return players
end

-- Clears all zombies from arena
function zombieArena:clear()
    local center = zombieArena.positions.arena.center
    local radius = zombieArena.positions.arena.radius
    local monsters = Game.getSpectators(center, false, false, radius, radius, radius, radius)

    if monsters == nil then
        return false
    end

    if #monsters < 0 then
        return false
    end

    for i = 1, #monsters do
        monster = Creature(monsters[i])
        monster:remove()
    end
    --zombieArena:debug("Zombie arena cleared.")
    return true
end


-- If there's more players than the required minimum, 
-- teleport all players from waiting room to the arena.
function zombieArena:teleportPlayers()
    players = zombieArena:checkWaitingRoom()
    if players ~= nil then
       
        -- Not enough players
        if #players < zombieArena.config.minPlayers then
            return false
        end

        -- Teleport players
        for i = 1, #players do
            local player = Player(players[i])
            player:teleportTo(zombieArena.positions.arena.center)
            player:registerEvent("ZombieArenaDeath")
            --zombieArena:debug(player:getName() .. " was teleported to arena.")
            zombieArena:addPlayer(player)
        end
        return true
    end
end

-- Adds player to the event
function zombieArena:addPlayer(player)
    player:setStorageValue(zombieArena.storages.playerOnEvent, 1)
    Game.setStorageValue(zombieArena.storages.playersOnEvent, zombieArena:getPlayersLeft() + 1)
    --zombieArena:debug(player:getName() .. " was added to event.")
end

-- Removes player from the event
function zombieArena:removePlayer(uid)
    local player = Player(uid)
	if player then
        player:removeCondition(CONDITION_INFIGHT)
		player:addHealth(player:getMaxHealth())
		player:addMana(player:getMaxMana())
		player:unregisterEvent("zombiearena")
		player:unregisterEvent("ZombieArenaDeath")
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        player:setStorageValue(zombieArena.storages.playerOnEvent, 0)
        Game.setStorageValue(zombieArena.storages.playersOnEvent, zombieArena:getPlayersLeft() - 1)
    --zombieArena:debug(player:getName() .. " was removed from event.")
end
end
-- Gets all players on event
function zombieArena:getPlayersLeft()
    return Game.getStorageValue(zombieArena.storages.playersOnEvent)
end


-- Message a group of people
function zombieArena:messageGroup(players, message)
    for i = 1, #players do
        local player = Player(players[i])
        player:sendTextMessage(MESSAGE_STATUS_WARNING, message)
    end
end

-- Spawns a monster randomly within the radius provided in positions
function zombieArena:createMonster(i)

    -- Purposely written this way instead of using the table directly,
    -- since tables are pass by reference.
    local radius = zombieArena.positions.arena.radius 
    local x = zombieArena.positions.arena.center.x
    local y = zombieArena.positions.arena.center.y
    local z = zombieArena.positions.arena.center.z
    x = math.random(x - radius, x + radius)
    y = math.random(y - radius, y + radius)
   
    local function create()
        -- Create monster
        if zombieArena:isStarted() then
            if Game.createMonster(zombieArena.config.monster, Position(x, y, z)) then
                Position(x, y, z):sendMagicEffect(CONST_ME_BLACKSMOKE)
                local message = string.format("%s created at position {x = %d, y = %d, z = %d}", zombieArena.config.monster, x, y, z)
                --zombieArena:debug(message)
                return true
            end
        end
    end

    if addEvent(create, i * zombieArena.config.secondsBetweenZombies * 1000) then
        return true
    end
   
    -- Something went wrong
    local message = string.format("Unexpected error: couldn't create %s at position {x = %d, y = %d, z = %d}", monster, x, y, z)
    --zombieArena:debug(message)
    return false
end

-- Summon x monsters provided in config
function zombieArena:summonMonsters()
    for i = 1, zombieArena.config.monsters do
            zombieArena:createMonster(i)
    end
    local message = string.format("%d monsters will be summoned.", zombieArena.config.monsters)
    --zombieArena:debug(message)
end

-- Gets how many monsters there left in arena
function zombieArena:getMonstersLeft()
    return Game.getStorageValue(zombieArena.storages.monstersLeft)
end


function zombieArena:onKill(killer)

    players = zombieArena:checkArena()

    -- Subtract one from monstersLeft
    Game.setStorageValue(zombieArena.storages.monstersLeft, zombieArena:getMonstersLeft() - 1)

    -- Check if event is complete
    if zombieArena:getMonstersLeft() == 0 then
        for i = 1, #players do
            local player = Player(players[i])
            zombieArena:reward(player)
        end

        -- Ends the event
        zombieArena:finish(true)
        return true
    end

    local message = string.format("%s killed a %s! Only %d left.", killer:getName(), zombieArena.config.monster, zombieArena:getMonstersLeft())
    if players ~= nil then 
        zombieArena:messageGroup(players, message)
    end
    --zombieArena:debug(message)
end

function zombieArena:finish(playersWon)

    if playersWon then
        Game.broadcastMessage(zombieArena.messages.eventFinished, MESSAGE_STATUS_WARNING)
        --zombieArena:debug(zombieArena.messages.eventFinished)
    else
        Game.broadcastMessage(zombieArena.messages.eventFailed, MESSAGE_STATUS_WARNING)
    --zombieArena:debug(zombieArena.messages.eventFailed)
    end

    Game.setStorageValue(zombieArena.storages.eventStarted, 0)
    Game.setStorageValue(zombieArena.storages.eventFinished, 1)
end

-- Give the players who survived the event a reward
-- and teleport to hometown
function zombieArena:reward(player)
    for i = 1, #zombieArena.rewards do
        player:addItem(zombieArena.rewards[i].itemid, zombieArena.rewards[i].count)

        local message = string.format("You received a %s.", zombieArena.rewards[i].name)
        player:sendTextMessage(MESSAGE_STATUS_WARNING, message)
        --zombieArena:debug(player:getName() .. " received a " .. zombieArena.rewards[i].name)

    end
    player:teleportTo(player:getTown():getTemplePosition())
    --zombieArena:debug(player:getName() .. " got teleported to " .. player:getTown():getName() .. ".")

    zombieArena:removePlayer(player)
    return true
end

-- Checks if event is finished
-- returns either true or false
function zombieArena:isFinished()
    if Game.getStorageValue(zombieArena.storages.eventFinished) == 1 then
        return true
    end
    return false
end

-- Checks if event has started
-- returns either true or false
function zombieArena:isStarted()
    if Game.getStorageValue(zombieArena.storages.eventStarted) == 1 then
        return true
    end
    return false
end

-- Checks if event is opened
-- returns either true or false
function zombieArena:isOpened()
    if Game.getStorageValue(zombieArena.storages.eventOpened) == 1 then
        return true
    end
    return false
end


-- Check if player is doing event
-- returns either true or false
function zombieArena:isPlayerOnEvent(player)
    if player:getStorageValue(zombieArena.storages.playerOnEvent) == 1 then
        return true
    end
    return false
end

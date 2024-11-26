BOMBERMAN_PLAYERS = {}
BOMBERMAN_EVENT_ACTIVE = false -- Tracks if the event is currently active
local barrelPositions = 
 {
    Position(31901, 32426, 7),
    Position(31901, 32427, 7),
    Position(31901, 32428, 7),
    Position(31901, 32429, 7),
    Position(31901, 32430, 7),
    Position(31901, 32431, 7),
    Position(31901, 32432, 7),
    Position(31901, 32433, 7),
    Position(31901, 32434, 7),
    Position(31901, 32438, 7),
    Position(31901, 32439, 7),
    Position(31901, 32440, 7),
    Position(31901, 32441, 7),
    Position(31901, 32442, 7),
    Position(31901, 32443, 7),
    Position(31901, 32444, 7),
    Position(31901, 32445, 7),
    Position(31901, 32446, 7),
    Position(31902, 32426, 7),
    Position(31902, 32428, 7),
    Position(31902, 32430, 7),
    Position(31902, 32432, 7),
    Position(31902, 32434, 7),
    Position(31902, 32438, 7),
    Position(31902, 32440, 7),
    Position(31902, 32442, 7),
    Position(31902, 32444, 7),
    Position(31902, 32446, 7),
    Position(31903, 32424, 7),
    Position(31903, 32425, 7),
    Position(31903, 32426, 7),
    Position(31903, 32427, 7),
    Position(31903, 32428, 7),
    Position(31903, 32429, 7),
    Position(31903, 32430, 7),
    Position(31903, 32431, 7),
    Position(31903, 32432, 7),
    Position(31903, 32433, 7),
    Position(31903, 32434, 7),
    Position(31903, 32435, 7),
    Position(31903, 32436, 7),
    Position(31903, 32437, 7),
    Position(31903, 32438, 7),
    Position(31903, 32439, 7),
    Position(31903, 32440, 7),
    Position(31903, 32441, 7),
    Position(31903, 32442, 7),
    Position(31903, 32443, 7),
    Position(31903, 32444, 7),
    Position(31903, 32445, 7),
    Position(31903, 32446, 7),
    Position(31903, 32447, 7),
    Position(31903, 32448, 7),
    Position(31904, 32424, 7),
    Position(31904, 32426, 7),
    Position(31904, 32428, 7),
    Position(31904, 32430, 7),
    Position(31904, 32432, 7),
    Position(31904, 32434, 7),
    Position(31904, 32436, 7),
    Position(31904, 32438, 7),
    Position(31904, 32440, 7),
    Position(31904, 32442, 7),
    Position(31904, 32444, 7),
    Position(31904, 32446, 7),
    Position(31904, 32448, 7),
    Position(31905, 32424, 7),
    Position(31905, 32425, 7),
    Position(31905, 32426, 7),
    Position(31905, 32427, 7),
    Position(31905, 32428, 7),
    Position(31905, 32429, 7),
    Position(31905, 32430, 7),
    Position(31905, 32431, 7),
    Position(31905, 32432, 7),
    Position(31905, 32433, 7),
    Position(31905, 32434, 7),
    Position(31905, 32435, 7),
    Position(31905, 32436, 7),
    Position(31905, 32437, 7),
    Position(31905, 32438, 7),
    Position(31905, 32439, 7),
    Position(31905, 32440, 7),
    Position(31905, 32441, 7),
    Position(31905, 32442, 7),
    Position(31905, 32443, 7),
    Position(31905, 32444, 7),
    Position(31905, 32445, 7),
    Position(31905, 32446, 7),
    Position(31905, 32447, 7),
    Position(31905, 32448, 7),
    Position(31906, 32424, 7),
    Position(31906, 32426, 7),
    Position(31906, 32428, 7),
    Position(31906, 32432, 7),
    Position(31906, 32434, 7),
    Position(31906, 32436, 7),
    Position(31906, 32438, 7),
    Position(31906, 32440, 7),
    Position(31906, 32442, 7),
    Position(31906, 32444, 7),
    Position(31906, 32446, 7),
    Position(31906, 32448, 7),
    Position(31907, 32424, 7),
    Position(31907, 32425, 7),
    Position(31907, 32426, 7),
    Position(31907, 32427, 7),
    Position(31907, 32428, 7),
    Position(31907, 32432, 7),
    Position(31907, 32433, 7),
    Position(31907, 32434, 7),
    Position(31907, 32435, 7),
    Position(31907, 32436, 7),
    Position(31907, 32437, 7),
    Position(31907, 32438, 7),
    Position(31907, 32439, 7),
    Position(31907, 32440, 7),
    Position(31907, 32441, 7),
    Position(31907, 32442, 7),
    Position(31907, 32443, 7),
    Position(31907, 32444, 7),
    Position(31907, 32445, 7),
    Position(31907, 32446, 7),
    Position(31907, 32447, 7),
    Position(31907, 32448, 7),
    Position(31908, 32424, 7),
    Position(31908, 32426, 7),
    Position(31908, 32428, 7),
    Position(31908, 32432, 7),
    Position(31908, 32434, 7),
    Position(31908, 32436, 7),
    Position(31908, 32438, 7),
    Position(31908, 32440, 7),
    Position(31908, 32444, 7),
    Position(31908, 32446, 7),
    Position(31908, 32448, 7),
    Position(31909, 32424, 7),
    Position(31909, 32425, 7),
    Position(31909, 32426, 7),
    Position(31909, 32427, 7),
    Position(31909, 32428, 7),
    Position(31909, 32429, 7),
    Position(31909, 32430, 7),
    Position(31909, 32431, 7),
    Position(31909, 32432, 7),
    Position(31909, 32433, 7),
    Position(31909, 32434, 7),
    Position(31909, 32435, 7),
    Position(31909, 32436, 7),
    Position(31909, 32437, 7),
    Position(31909, 32438, 7),
    Position(31909, 32439, 7),
    Position(31909, 32440, 7),
    Position(31909, 32444, 7),
    Position(31909, 32445, 7),
    Position(31909, 32446, 7),
    Position(31909, 32447, 7),
    Position(31909, 32448, 7),
    Position(31910, 32424, 7),
    Position(31910, 32426, 7),
    Position(31910, 32428, 7),
    Position(31910, 32430, 7),
    Position(31910, 32432, 7),
    Position(31910, 32434, 7),
    Position(31910, 32436, 7),
    Position(31910, 32438, 7),
    Position(31910, 32440, 7),
    Position(31910, 32444, 7),
    Position(31910, 32446, 7),
    Position(31910, 32448, 7),
    Position(31911, 32424, 7),
    Position(31911, 32425, 7),
    Position(31911, 32426, 7),
    Position(31911, 32427, 7),
    Position(31911, 32428, 7),
    Position(31911, 32429, 7),
    Position(31911, 32430, 7),
    Position(31911, 32431, 7),
    Position(31911, 32432, 7),
    Position(31911, 32433, 7),
    Position(31911, 32434, 7),
    Position(31911, 32435, 7),
    Position(31911, 32436, 7),
    Position(31911, 32437, 7),
    Position(31911, 32438, 7),
    Position(31911, 32439, 7),
    Position(31911, 32440, 7),
    Position(31911, 32441, 7),
    Position(31911, 32442, 7),
    Position(31911, 32443, 7),
    Position(31911, 32444, 7),
    Position(31911, 32445, 7),
    Position(31911, 32446, 7),
    Position(31911, 32447, 7),
    Position(31911, 32448, 7),
    Position(31912, 32424, 7),
    Position(31912, 32426, 7),
    Position(31912, 32428, 7),
    Position(31912, 32430, 7),
    Position(31912, 32432, 7),
    Position(31912, 32438, 7),
    Position(31912, 32440, 7),
    Position(31912, 32442, 7),
    Position(31912, 32444, 7),
    Position(31912, 32446, 7),
    Position(31912, 32448, 7),
    Position(31913, 32425, 7),
    Position(31913, 32426, 7),
    Position(31913, 32427, 7),
    Position(31913, 32428, 7),
    Position(31913, 32429, 7),
    Position(31913, 32430, 7),
    Position(31913, 32431, 7),
    Position(31913, 32432, 7),
    Position(31913, 32438, 7),
    Position(31913, 32439, 7),
    Position(31913, 32440, 7),
    Position(31913, 32441, 7),
    Position(31913, 32442, 7),
    Position(31913, 32443, 7),
    Position(31913, 32444, 7),
    Position(31913, 32445, 7),
    Position(31913, 32446, 7),
    Position(31913, 32447, 7),
    Position(31913, 32448, 7),
    Position(31914, 32448, 7),
    Position(31915, 32448, 7),
    Position(31916, 32425, 7),
    Position(31916, 32426, 7),
    Position(31916, 32427, 7),
    Position(31916, 32428, 7),
    Position(31916, 32429, 7),
    Position(31916, 32430, 7),
    Position(31916, 32431, 7),
    Position(31916, 32432, 7),
    Position(31916, 32438, 7),
    Position(31916, 32439, 7),
    Position(31916, 32440, 7),
    Position(31916, 32441, 7),
    Position(31916, 32442, 7),
    Position(31916, 32443, 7),
    Position(31916, 32444, 7),
    Position(31916, 32445, 7),
    Position(31916, 32446, 7),
    Position(31916, 32447, 7),
    Position(31916, 32448, 7),
    Position(31917, 32424, 7),
    Position(31917, 32426, 7),
    Position(31917, 32428, 7),
    Position(31917, 32430, 7),
    Position(31917, 32432, 7),
    Position(31917, 32438, 7),
    Position(31917, 32440, 7),
    Position(31917, 32442, 7),
    Position(31917, 32444, 7),
    Position(31917, 32446, 7),
    Position(31917, 32448, 7),
    Position(31918, 32424, 7),
    Position(31918, 32425, 7),
    Position(31918, 32426, 7),
    Position(31918, 32427, 7),
    Position(31918, 32428, 7),
    Position(31918, 32429, 7),
    Position(31918, 32430, 7),
    Position(31918, 32431, 7),
    Position(31918, 32432, 7),
    Position(31918, 32433, 7),
    Position(31918, 32434, 7),
    Position(31918, 32435, 7),
    Position(31918, 32436, 7),
    Position(31918, 32437, 7),
    Position(31918, 32438, 7),
    Position(31918, 32439, 7),
    Position(31918, 32440, 7),
    Position(31918, 32441, 7),
    Position(31918, 32442, 7),
    Position(31918, 32443, 7),
    Position(31918, 32444, 7),
    Position(31918, 32445, 7),
    Position(31918, 32446, 7),
    Position(31918, 32447, 7),
    Position(31918, 32448, 7),
    Position(31919, 32424, 7),
    Position(31919, 32426, 7),
    Position(31919, 32428, 7),
    Position(31919, 32430, 7),
    Position(31919, 32432, 7),
    Position(31919, 32434, 7),
    Position(31919, 32436, 7),
    Position(31919, 32438, 7),
    Position(31919, 32440, 7),
    Position(31919, 32444, 7),
    Position(31919, 32446, 7),
    Position(31919, 32448, 7),
    Position(31920, 32424, 7),
    Position(31920, 32425, 7),
    Position(31920, 32426, 7),
    Position(31920, 32427, 7),
    Position(31920, 32428, 7),
    Position(31920, 32429, 7),
    Position(31920, 32430, 7),
    Position(31920, 32431, 7),
    Position(31920, 32432, 7),
    Position(31920, 32433, 7),
    Position(31920, 32434, 7),
    Position(31920, 32435, 7),
    Position(31920, 32436, 7),
    Position(31920, 32437, 7),
    Position(31920, 32438, 7),
    Position(31920, 32439, 7),
    Position(31920, 32440, 7),
    Position(31920, 32444, 7),
    Position(31920, 32445, 7),
    Position(31920, 32446, 7),
    Position(31920, 32447, 7),
    Position(31920, 32448, 7),
    Position(31921, 32424, 7),
    Position(31921, 32426, 7),
    Position(31921, 32428, 7),
    Position(31921, 32432, 7),
    Position(31921, 32434, 7),
    Position(31921, 32436, 7),
    Position(31921, 32438, 7),
    Position(31921, 32440, 7),
    Position(31921, 32444, 7),
    Position(31921, 32446, 7),
    Position(31921, 32448, 7),
    Position(31922, 32424, 7),
    Position(31922, 32425, 7),
    Position(31922, 32426, 7),
    Position(31922, 32427, 7),
    Position(31922, 32428, 7),
    Position(31922, 32432, 7),
    Position(31922, 32433, 7),
    Position(31922, 32434, 7),
    Position(31922, 32435, 7),
    Position(31922, 32436, 7),
    Position(31922, 32437, 7),
    Position(31922, 32438, 7),
    Position(31922, 32439, 7),
    Position(31922, 32440, 7),
    Position(31922, 32441, 7),
    Position(31922, 32442, 7),
    Position(31922, 32443, 7),
    Position(31922, 32444, 7),
    Position(31922, 32445, 7),
    Position(31922, 32446, 7),
    Position(31922, 32447, 7),
    Position(31922, 32448, 7),
    Position(31923, 32424, 7),
    Position(31923, 32426, 7),
    Position(31923, 32428, 7),
    Position(31923, 32432, 7),
    Position(31923, 32434, 7),
    Position(31923, 32436, 7),
    Position(31923, 32438, 7),
    Position(31923, 32440, 7),
    Position(31923, 32442, 7),
    Position(31923, 32444, 7),
    Position(31923, 32446, 7),
    Position(31923, 32448, 7),
    Position(31924, 32424, 7),
    Position(31924, 32425, 7),
    Position(31924, 32426, 7),
    Position(31924, 32427, 7),
    Position(31924, 32428, 7),
    Position(31924, 32429, 7),
    Position(31924, 32430, 7),
    Position(31924, 32431, 7),
    Position(31924, 32432, 7),
    Position(31924, 32433, 7),
    Position(31924, 32434, 7),
    Position(31924, 32435, 7),
    Position(31924, 32436, 7),
    Position(31924, 32437, 7),
    Position(31924, 32438, 7),
    Position(31924, 32439, 7),
    Position(31924, 32440, 7),
    Position(31924, 32441, 7),
    Position(31924, 32442, 7),
    Position(31924, 32443, 7),
    Position(31924, 32444, 7),
    Position(31924, 32445, 7),
    Position(31924, 32446, 7),
    Position(31924, 32447, 7),
    Position(31924, 32448, 7),
    Position(31925, 32424, 7),
    Position(31925, 32426, 7),
    Position(31925, 32428, 7),
    Position(31925, 32430, 7),
    Position(31925, 32432, 7),
    Position(31925, 32434, 7),
    Position(31925, 32436, 7),
    Position(31925, 32438, 7),
    Position(31925, 32440, 7),
    Position(31925, 32442, 7),
    Position(31925, 32444, 7),
    Position(31925, 32446, 7),
    Position(31925, 32448, 7),
    Position(31926, 32424, 7),
    Position(31926, 32425, 7),
    Position(31926, 32426, 7),
    Position(31926, 32427, 7),
    Position(31926, 32428, 7),
    Position(31926, 32429, 7),
    Position(31926, 32430, 7),
    Position(31926, 32431, 7),
    Position(31926, 32432, 7),
    Position(31926, 32433, 7),
    Position(31926, 32434, 7),
    Position(31926, 32435, 7),
    Position(31926, 32436, 7),
    Position(31926, 32437, 7),
    Position(31926, 32438, 7),
    Position(31926, 32439, 7),
    Position(31926, 32440, 7),
    Position(31926, 32441, 7),
    Position(31926, 32442, 7),
    Position(31926, 32443, 7),
    Position(31926, 32444, 7),
    Position(31926, 32445, 7),
    Position(31926, 32446, 7),
    Position(31926, 32447, 7),
    Position(31926, 32448, 7),
    Position(31927, 32426, 7),
    Position(31927, 32428, 7),
    Position(31927, 32430, 7),
    Position(31927, 32432, 7),
    Position(31927, 32434, 7),
    Position(31927, 32438, 7),
    Position(31927, 32440, 7),
    Position(31927, 32442, 7),
    Position(31927, 32444, 7),
    Position(31927, 32446, 7),
    Position(31928, 32426, 7),
    Position(31928, 32427, 7),
    Position(31928, 32428, 7),
    Position(31928, 32429, 7),
    Position(31928, 32430, 7),
    Position(31928, 32431, 7),
    Position(31928, 32432, 7),
    Position(31928, 32433, 7),
    Position(31928, 32434, 7),
    Position(31928, 32438, 7),
    Position(31928, 32439, 7),
    Position(31928, 32440, 7),
    Position(31928, 32441, 7),
    Position(31928, 32442, 7),
    Position(31928, 32443, 7),
    Position(31928, 32444, 7),
    Position(31928, 32445, 7),
    Position(31928, 32446, 7),
}


local config = {
    enterTiles = {
        from = Position(31942, 32435, 7), -- Waiting area top-left corner
        to   = Position(31951, 32435, 7), -- Waiting area bottom-right corner
    },
    startPositions = {
        [1] = Position(31901, 32424, 7),
        [2] = Position(31928, 32424, 7),
        [3] = Position(31901, 32448, 7),
        [4] = Position(31928, 32448, 7),
        [5] = Position(31907, 32430, 7),
        [6] = Position(31922, 32430, 7),
        [7] = Position(31901, 32436, 7),
        [8] = Position(31928, 32436, 7),
        [9] = Position(31909, 32442, 7),
        [10] = Position(31920, 32442, 7),
    },
    minPlayerLimit      = 2,
    maxPlayerLimit      = 10,
    barrelId            = 8505,
    bombAid             = 13443,
    teleportItemId      = 34111,
    teleportPosition    = 
    destinationPosition = 
    playerMaxBombs      = 3,
    bombsAtStart        = 1,
    bombRadius          = 1,
    storageInGame       = 13449,
    storagePlayerBombs  = 13451,
    storageBombRadius   = 13450,
    countDownEffect     = CONST_ME_ENERGYAREA,
    explodeEffect       = CONST_ME_FIREAREA,
}

-- Create the teleport to the Bomberman event
local function createBombermanTeleport()
    local teleportPosition = config.teleportPosition
    local destination = config.destinationPosition

    -- Remove any existing teleport at the position
    local tile = Tile(teleportPosition)
    if tile then
        local existingTeleport = tile:getItemById(config.teleportItemId)
        if existingTeleport then
            existingTeleport:remove()
        end
    end

    -- Create the teleport
    local teleport = Game.createItem(config.teleportItemId, 1, teleportPosition)
    if teleport then
        teleport:setDestination(destination)
        Game.broadcastMessage("Bomberman Event is about to start! Quick, 4 participants required!", MESSAGE_STATUS_WARNING)
    else
        print("[Bomberman] Failed to create teleport at position " .. teleportPosition:toString())
    end
end

-- Reset the Bomberman arena
local function resetArena()
    BOMBERMAN_PLAYERS = {}
    BOMBERMAN_EVENT_ACTIVE = false -- Allow new games to start
    -- Rebuild barrels
    for _, pos in ipairs(barrelPositions) do
        local tile = Tile(pos)
        if tile and not tile:getItemById(config.barrelId) then
            Game.createItem(config.barrelId, 1, pos)
        end
    end

    Game.broadcastMessage("Bomberman arena reset. Get ready for the next round!", MESSAGE_STATUS_WARNING)
end

-- Check for a winner
local function checkWinner()
    local count = 0
    local lastPlayer = nil
    for cid, player in pairs(BOMBERMAN_PLAYERS) do
        if player then
            count = count + 1
            lastPlayer = player
        end
    end

    if count == 1 then
        lastPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You are the Bomberman champion!")
        lastPlayer:teleportTo(lastPlayer:getTown():getTemplePosition())
        resetArena()
    elseif count == 0 then
        resetArena()
    end
end

-- Get players waiting in the enter tiles
local function getPlayersWaiting()
    local players = {}
    for x = config.enterTiles.from.x, config.enterTiles.to.x do
        for y = config.enterTiles.from.y, config.enterTiles.to.y do
            local tile = Tile(Position(x, y, config.enterTiles.from.z))
            if tile then
                local creature = tile:getTopCreature()
                if creature and creature:isPlayer() then
                    table.insert(players, creature)
                end
            end
        end
    end
    return players
end

-- Start the Bomberman event
local function startBombermanEvent(player)
    if BOMBERMAN_EVENT_ACTIVE then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Bomberman event is already active. Please wait for the current game to finish.")
        return false
    end
    local playersWaiting = getPlayersWaiting()

    if #playersWaiting < config.minPlayerLimit then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "At least " .. config.minPlayerLimit .. " players are required to start the event.")
        return false
    end

    if #playersWaiting > config.maxPlayerLimit then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Too many players! Maximum allowed is " .. config.maxPlayerLimit .. ".")
        return false
    end

    -- Create the teleport
    createBombermanTeleport()

    -- Teleport players to start positions
    
    BOMBERMAN_PLAYERS = {}
    BOMBERMAN_EVENT_ACTIVE = true -- Mark the event as active
    for i, position in ipairs(config.startPositions) do
        local p = playersWaiting[i]
        if p then
            p:teleportTo(position)
            p:setStorageValue(config.storageInGame, 1)
            p:setStorageValue(config.storagePlayerBombs, config.bombsAtStart)
            p:setStorageValue(config.storageBombRadius, config.bombRadius)
            BOMBERMAN_PLAYERS[p:getId()] = p
        end
    end

    Game.broadcastMessage("Bomberman Event has started! Good luck to all participants.", MESSAGE_STATUS_WARNING)
    return true
end

-- TalkAction to start the Bomberman event
local bombermanCommand = TalkAction("!bomberman")
function bombermanCommand.onSay(player, words, param)
    if not startBombermanEvent(player) then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Could not start the event. Please check the conditions.")
    end
    return false
end
bombermanCommand:groupType("normal")
bombermanCommand:separator(" ")
bombermanCommand:register()
-- Function to process bomb explosion effects and damage
local function checkTiles(bombRadius, killerId, position)
    local directions = {"WEST", "EAST", "NORTH", "SOUTH"}
    local removalPosition = Position(31946, 32434, 7) -- Position to teleport players when hit

    for _, direction in ipairs(directions) do
        for i = 1, bombRadius do
            local tile
            if direction == "WEST" then
                tile = Tile(Position(position.x - i, position.y, position.z))
            elseif direction == "EAST" then
                tile = Tile(Position(position.x + i, position.y, position.z))
            elseif direction == "NORTH" then
                tile = Tile(Position(position.x, position.y - i, position.z))
            elseif direction == "SOUTH" then
                tile = Tile(Position(position.x, position.y + i, position.z))
            end

            if tile then
                local tilePos = tile:getPosition()

                -- Destroy barrels
                local barrel = tile:getItemById(config.barrelId)
                if barrel then
                    barrel:remove()
                    tilePos:sendMagicEffect(CONST_ME_BLOCKHIT) -- Effect for barrel destruction
                    break -- Stop the explosion in this direction after hitting a barrel
                end

                -- Damage and remove players from the game
                local creature = tile:getTopCreature()
                if creature and creature:isPlayer() then
                    -- Remove player from Bomberman game
                    creature:teleportTo(removalPosition)
                    creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                    creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were hit by a bomb and removed from the game!")
                    creature:setStorageValue(config.storageInGame, 0)
                    BOMBERMAN_PLAYERS[creature:getId()] = nil -- Remove from active players
                    checkWinner() -- Check if there’s a winner after removal
                end

                -- Stop explosion if tile is not walkable
                if not tile:isWalkable() then
                    break
                end

                -- Explosion effect
                tilePos:sendMagicEffect(config.explodeEffect)
            end
        end
    end

    -- Central explosion effect (on the bomb's position)
    position:sendMagicEffect(config.explodeEffect)
end

-- Function to handle bomb detonation
local function detonateBomb(position, timeLeft)
    if timeLeft <= 0 then
        -- Bomb explodes
        position:sendMagicEffect(config.explodeEffect)
        local tile = Tile(position)

        if tile then
            local ground = tile:getGround()
            if ground and ground:getActionId() == config.bombAid then
                local bombRadius = ground:getCustomAttribute("bombRadius") or config.bombRadius
                local killerId = ground:getCustomAttribute("killerId")
                ground:setActionId(0) -- Reset the Action ID
                checkTiles(bombRadius, killerId, position) -- Process damage and effects
            end
        end
        return
    end

    -- Countdown effect
    position:sendMagicEffect(config.countDownEffect)
    addEvent(detonateBomb, 1000, position, timeLeft - 1)
end

-- Function to block the position of the bomb
local function blockBombPosition(position, timeLeft)
    local bombItemId = 2187 -- Adjust to a blocking item ID (e.g., "stone wall" or "blocking object")
    local tile = Tile(position)

    -- Place a blocking item
    if tile then
        local blockingItem = Game.createItem(bombItemId, 1, position)
        addEvent(function()
            -- Remove the blocking item after the bomb explodes
            local tileAfter = Tile(position)
            if tileAfter then
                local item = tileAfter:getItemById(bombItemId)
                if item then
                    item:remove()
                end
            end
        end, timeLeft * 1000) -- Convert timeLeft from seconds to milliseconds
    end
end

-- !bomb command
local bombCommand = TalkAction("!bomb")

function bombCommand.onSay(player, words, param)
    if player:getStorageValue(config.storageInGame) <= 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must be in the Bomberman game to use bombs.")
        return false
    end

    local position = player:getPosition()
    local tile = Tile(position)
    if not tile then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot place bombs here.")
        return false
    end

    -- Validate the ground item before setting Action ID
    local ground = tile:getGround()
    if not ground or not ground:isItem() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Bombs cannot be placed on this type of ground.")
        return false
    end

    -- Check if the ground already has an Action ID to avoid overwriting
    if ground:getActionId() == config.bombAid then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot place two bombs on the same tile.")
        return false
    end

    -- Track the number of bombs placed by the player
    local bombCount = player:getStorageValue(config.storagePlayerBombs) or 0
    player:setStorageValue(config.storagePlayerBombs, bombCount + 1)

    -- Dynamically increase bomb radius after the first 8 bombs
    local bombRadius = config.bombRadius
    if bombCount >= 8 then
        bombRadius = config.bombRadius + math.floor((bombCount - 8) / 1) -- +1 radius for every bomb after the 8th
    end
    player:setStorageValue(config.storageBombRadius, bombRadius)

    -- Set the Action ID and trigger countdown effect
    ground:setActionId(config.bombAid)
    ground:setCustomAttribute("bombRadius", bombRadius)
    ground:setCustomAttribute("killerId", player:getId())
    position:sendMagicEffect(config.countDownEffect)

    -- Block the position
    blockBombPosition(position, config.bombDelay or 3)

    -- Start the bomb countdown
    detonateBomb(position, config.bombDelay or 3)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have placed a bomb!")
    return true
end

bombCommand:groupType("normal")
bombCommand:separator(" ")
bombCommand:register()

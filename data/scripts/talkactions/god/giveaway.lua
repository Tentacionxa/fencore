local labyrinthEventCommand = TalkAction("!giveaway")

local function startLabyrinthEvent(player)
    local teleportPosition = Position(32354, 32219, 7)
    local waitingRoomPosition = Position(30, 1135, 7)
    local teleportItemId = 25057
    local eventStartPosition = Position(34141, 33774, 8)
    local endPosition = Position(32354, 32220, 7)
    local playerStorageKey = 570707
    local preparationDuration = 5 * 60 * 1000 -- 5 minutes
    local eventDuration = 25 * 60 * 1000 -- 30 minutes
    local checkBackTime = 25 * 60 * 1000 -- 20 minutes

    -- Announce event start
    Game.broadcastMessage("Giveaway Labyrinth has been started. Enter the Thais Depo Raid Teleport to enter the event. Event starts in 5 minutes.", MESSAGE_STATUS_WARNING)

    -- Create teleport to the waiting room
    local teleport = Game.createItem(teleportItemId, 1, teleportPosition)
    if teleport then
        teleport:setDestination(waitingRoomPosition)
        teleport:setActionId(25057)
    end

    -- Timer to close the teleport and start the event
    addEvent(function()
        -- Remove the teleport
        local tile = Tile(teleportPosition)
        if tile then
            local teleportItem = tile:getItemById(teleportItemId)
            if teleportItem then
                teleportItem:remove()
            end
        end

        -- Collect players with the event storage key and teleport them to the event start position
        local participants = {}
        for _, creature in ipairs(Game.getPlayers()) do
            if creature:getStorageValue(playerStorageKey) == 1 then
                table.insert(participants, creature:getId())
                creature:teleportTo(eventStartPosition)
                creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
            end
        end

        -- Announce event start
        Game.broadcastMessage("Labyrinth Event has begun. You have 25 minutes. Good Luck!", MESSAGE_STATUS_WARNING)

        -- Timer to check 20-minute mark and teleport back remaining participants
        addEvent(function()
            for _, pid in ipairs(participants) do
                local player = Player(pid)
                if player and player:getStorageValue(playerStorageKey) == 1 then
                    -- Teleport back if still in the event after 20 minutes
                    player:teleportTo(endPosition)
                    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "20 minutes have passed! You have been teleported back.")
                    player:setStorageValue(playerStorageKey, -1) -- Reset storage
                end
            end
        end, checkBackTime)

        -- Timer for full event completion (30 minutes)
        addEvent(function()
            local winners = _G.labyrinthWinners or {}

            -- Teleport remaining participants back and reset storage
            for _, pid in ipairs(participants) do
                local player = Player(pid)
                if player and player:getStorageValue(playerStorageKey) == 1 then
                    player:teleportTo(endPosition)
                    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                    player:setStorageValue(playerStorageKey, -1) -- Reset storage
                end
            end

            -- Announce event completion
            Game.broadcastMessage("Labyrinth Event has been completed. Winners: " .. (#winners > 0 and table.concat(winners, ", ") or "None") .. ".", MESSAGE_STATUS_WARNING)

            -- Clear winners list to clean up for future events
            _G.labyrinthWinners = nil
        end, eventDuration)
    end, preparationDuration)
end

function labyrinthEventCommand.onSay(player, words, param)
    startLabyrinthEvent(player)
    return false
end

-- Register command
labyrinthEventCommand:separator(" ")
labyrinthEventCommand:groupType("god")
labyrinthEventCommand:register()

-- Teleport handler for registering players
local labyrinthTeleport = MoveEvent()

function labyrinthTeleport.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    -- Register player in the event using storage
    if player:getStorageValue(570707) ~= 1 then
        player:setStorageValue(570707, 1) -- Set the storage value to register the player
        Game.broadcastMessage(player:getName() .. " has entered the Giveaway Labyrinth Event.", MESSAGE_STATUS_WARNING)
    end

    -- Teleport logic to waiting room
    local waitingRoomPosition = Position(30, 1135, 7)
    player:teleportTo(waitingRoomPosition)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

labyrinthTeleport:type("stepin")
labyrinthTeleport:aid(25057) -- Assuming action ID for the teleport is used here
labyrinthTeleport:register()



-- Exit Teleport Handler for Winning Logic
local exitTeleport = MoveEvent()

function exitTeleport.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    -- Check if player is registered for the event
    if player:getStorageValue(570707) == 1 then
        -- Initialize the winners list if not already done
        if not _G.labyrinthWinners then
            _G.labyrinthWinners = {}
        end

        -- Add player to winners list and reward them if there are less than 3 winners
        if #_G.labyrinthWinners < 3 then
            table.insert(_G.labyrinthWinners, player:getName())
            player:addItem(22118, 1000) -- Reward Tibia coins
            player:teleportTo(Position(32354, 32220, 7)) -- Teleport to end position
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
            player:setStorageValue(570707, -1) -- Reset storage

            -- If there are now 3 winners, conclude the event
            if #_G.labyrinthWinners == 3 then
                Game.broadcastMessage("Labyrinth Event has been completed. Winners: " .. table.concat(_G.labyrinthWinners, ", ") .. ".", MESSAGE_STATUS_WARNING)

                -- Teleport all remaining participants back to the end position
                for _, creature in ipairs(Game.getPlayers()) do
                    if creature:getStorageValue(570707) == 1 then
                        creature:teleportTo(Position(32354, 32220, 7))
                        creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                        creature:setStorageValue(570707, -1) -- Reset storage
                    end
                end

                -- Clear winners list to clean up for future events
                _G.labyrinthWinners = nil
            end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The event already has 3 winners.")
        end
    end
    return true
end

exitTeleport:type("stepin")
exitTeleport:aid(1949) -- Assuming action ID for the exit teleport is used here
exitTeleport:register()

local labyrinthOnPrepareDeath = CreatureEvent("LabyrinthOnPrepareDeath")

function labyrinthOnPrepareDeath.onPrepareDeath(player, killer)
    -- Check if the player is registered in the Labyrinth Event
    if player:getStorageValue(570707) == 1 then
        -- Send a message to the player
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were defeated in the Labyrinth Event and have been teleported back.")

        -- Teleport the player to the temple position
        local templePosition = Position(32354, 32220, 7)
        player:teleportTo(templePosition)
        player:addHealth(player:getMaxHealth())
        player:addMana(player:getMaxMana())
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

        -- Reset the player's storage value
        player:setStorageValue(570707, -1)

        -- Prevent the actual death
        return false
    end

    -- Allow normal death handling for other scenarios
    return true
end

labyrinthOnPrepareDeath:register()
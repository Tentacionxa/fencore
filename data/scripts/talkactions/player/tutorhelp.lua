local tutorRequest = TalkAction("!tutor")
local cooldowns = {}
local pendingTeleportRequests = {} -- Table to store unique storage keys for each player

-- Function for the initial !tutor request
function tutorRequest.onSay(player, words, param)
    local playerId = player:getId()
    local currentTime = os.time()
    local cooldownTime = 120 -- Cooldown time in seconds

    -- Check if the player is on cooldown
    if cooldowns[playerId] and (currentTime - cooldowns[playerId]) < cooldownTime then
        local remainingTime = cooldownTime - (currentTime - cooldowns[playerId])
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must wait " .. remainingTime .. " seconds before using this command again.")
        return true
    end

    -- Set the cooldown time for the player
    cooldowns[playerId] = currentTime

    local playerName = player:getName()
    local message = playerName .. " is requesting assistance with !tutor."

    -- Generate a unique storage key for this request
    local uniqueStorageKey = math.random(100000, 999999) -- Random storage key, can be adjusted as needed
    pendingTeleportRequests[playerId] = uniqueStorageKey
    player:setStorageValue(uniqueStorageKey, player:getId()) -- Store the requesting player's ID

    -- List of specific players to receive the broadcast
    local targetPlayers = {
        "Kakina",  
        "Nowe Porzadki", 
        "Royal Araysuke", 
        "GM Michal", 
        "GM Maksym", 
        "Caric Laye", 
        "Araysuke"
    }

    -- Notify target players and set storage value for teleport request
    for _, targetName in ipairs(targetPlayers) do
        local targetPlayer = Player(targetName)
        if targetPlayer then
            targetPlayer:sendTextMessage(MESSAGE_ADMINISTRATOR, message .. " Use '!help' to accept the request.")
            targetPlayer:setStorageValue(uniqueStorageKey, playerId) -- Store the requesting player's ID with unique storage key
        end
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your request has been sent to a Fencore Team Member.")
    return true
end

tutorRequest:separator(" ")
tutorRequest:groupType("normal") -- Restricting only to players
tutorRequest:register()

local helpAccept = TalkAction("!help")

-- Function to handle teleportation
function helpAccept.onSay(player, words, param)
    -- Check if the player has one of the required group IDs
    local groupId = player:getGroup():getId()
    if groupId < 2 or groupId > 6 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have permission to use this command.")
        return true
    end

    -- Check if the player is in a protection zone or in a fight
    local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
    local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
    if inFight then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot use this command while in a fight.")
        return true
    end

    -- Iterate through the pending teleport requests to find a match
    for requesterId, uniqueStorageKey in pairs(pendingTeleportRequests) do
        local storedRequesterId = player:getStorageValue(uniqueStorageKey)
        if storedRequesterId == requesterId then
            local requesterPlayer = Player(requesterId)
            if requesterPlayer then
                -- Teleport the player to the requester
                player:teleportTo(requesterPlayer:getPosition())
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been teleported to the player requesting assistance.")
                
                -- Clear storage for this specific request
                player:setStorageValue(uniqueStorageKey, -1)
                pendingTeleportRequests[requesterId] = nil
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The player requesting assistance is no longer online.")
            end
            return true -- Exit after handling one request
        end
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "No pending teleport requests.")
    return true
end

helpAccept:separator(" ")
helpAccept:groupType("normal") -- Restricting to normal players, change as needed
helpAccept:register()

local supremeCube = Action()

local config = {
    storage = 9009,
    cooldown = 120
}

local function supremeCubeMessage(player, effect, message)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
    player:getPosition():sendMagicEffect(effect)
end

local function getHouseEntry(houseId)
    local h = House(houseId)
    return h and h:getExitPosition() or false
end

local function getHouseName(houseId)
    local h = House(houseId)
    return h and h:getName() or "Unknown House"
end

local function getInvitedHouses(player)
    local playerName = player:getName():lower() -- Normalize case for matching
    local invitedHouses = {}
    local query = db.storeQuery("SELECT `house_id`, `list` FROM `house_lists`")
    
    if query then
        repeat
            local houseId = result.getDataInt(query, "house_id")
            local list = result.getDataString(query, "list")

            -- Split the list by newlines and trim whitespace for each name
            for name in string.gmatch(list, "[^\r\n]+") do
                name = name:match("^%s*(.-)%s*$"):lower() -- Trim whitespace and normalize case
                if name == playerName then
                    table.insert(invitedHouses, houseId)
                    break
                end
            end
        until not result.next(query)
        result.free(query)
    end
    return invitedHouses
end

local function windowChoice(window, player, houseId)
    local entryPosition = getHouseEntry(houseId)
    if not entryPosition then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid house entry position.")
        return
    end
    local houseName = getHouseName(houseId)
    window:addChoice(houseName, function(player, button, choice)
        if button.name == "Select" then
            player:teleportTo(entryPosition, true)
            supremeCubeMessage(player, CONST_ME_TELEPORT, "Teleported to " .. houseName)
            player:setStorageValue(config.storage, os.time() + config.cooldown)
        end
        return true
    end)
end

function supremeCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
    local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)

    if not inPz and inFight then
        supremeCubeMessage(player, CONST_ME_POFF, "You can't use this when you're in a fight.")
        return false
    end

    if player:getStorageValue(config.storage) > os.time() then
        local remainingTime = player:getStorageValue(config.storage) - os.time()
        supremeCubeMessage(player, CONST_ME_POFF, "You can use it again in: " .. remainingTime .. " seconds.")
        return false
    end

    -- Get the player's own house if they own one
    local house = player:getHouse()
    local invitedHouses = getInvitedHouses(player)

    -- Add the player's own house to the list if they own one
    if house then
        table.insert(invitedHouses, house:getId()) -- Add the player's own house ID
    end

    if #invitedHouses == 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not invited to any houses.")
        return true
    end

    -- Create modal window
    local window = ModalWindow({
        title = "Invited Houses",
        message = "Select a house to teleport to:",
    })

    for _, houseId in ipairs(invitedHouses) do
        windowChoice(window, player, houseId)
    end

    window:addButton("Select")
    window:addButton("Close")
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(player)

    return true
end

supremeCube:id(19361) -- Replace with your actual item ID
supremeCube:register()

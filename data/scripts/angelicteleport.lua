-- Pink Teleport
local pinkTeleport = MoveEvent()

function pinkTeleport.onStepIn(creature, item, toPosition, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if player:getStorageValue(51857) <= 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Portal has moved You to the cities' entrance.")
        player:teleportTo(Position(32945, 33511, 4))
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:teleportTo(Position(32920, 33480, 4))
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end

    return true
end

pinkTeleport:position(Position(32361, 32219, 7))
pinkTeleport:register()

-- City Teleport
local cityTeleport = MoveEvent()

function cityTeleport.onStepIn(creature, item, toPosition, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Back to the main world...")
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:teleportTo(Position(32361, 32220, 7))

    return true
end

cityTeleport:position(Position(32951, 33506, 4))
cityTeleport:register()

local thaisTeleport = MoveEvent()

function thaisTeleport.onStepIn(creature, item, toPosition, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Back to the main world...")
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:teleportTo(Position(32361, 32220, 7))

    return true
end

thaisTeleport:position(Position(32934, 33484, 5))
thaisTeleport:register()
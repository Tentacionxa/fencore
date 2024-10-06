-- Pink Teleport
local pinkTeleport = MoveEvent()

function pinkTeleport.onStepIn(creature, item, toPosition, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if player:getStorageValue(410857) == 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not worthy to enter the other world.")
        player:teleportTo(Position(32359, 32220, 7))
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:teleportTo(Position(32749, 33205, 4))
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end

    return true
end

pinkTeleport:position(Position(32359, 32219, 7))
pinkTeleport:register()

-- Battle Teleport
local battleTeleport = MoveEvent()

function battleTeleport.onStepIn(creature, item, toPosition, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if player:getStorageValue(425857) == 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't meet the battle requirements. Speak to Visco about the battle access. He is the only gatekeeper.")
        player:teleportTo(Position(31491, 31738, 7))
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    elseif player:getLevel() < 2000 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't meet the battle requirements. The minimum level requirement is 2000.")
        player:teleportTo(Position(31491, 31738, 7))
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:teleportTo(Position(32712, 33337, 7))
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end

    return true
end

battleTeleport:position(Position(31491, 31737, 7))
battleTeleport:register()

-- City Teleport
local cityTeleport = MoveEvent()

function cityTeleport.onStepIn(creature, item, toPosition, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Back to the main world...")
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:teleportTo(Position(32359, 32220, 7))

    return true
end

cityTeleport:position(Position(32749, 33204, 4))
cityTeleport:register()

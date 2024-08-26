local setting = {
    [5001] = { position = Position(33339, 32127, 7) },
    [5002] = { position = Position(33339, 32127, 7)},
    [5003] = { position = Position(33575, 32224, 7) },
    [5004] = { position = Position(33575, 32224, 7)},
}

local teleportLocationsEvent = MoveEvent()

function teleportLocationsEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    local settingData = setting[item.actionid]
    if not settingData then
        return true
    end

    if settingData.minLevel and player:getLevel() < settingData.minLevel then
        player:sendTextMessage(MESSAGE_STATUS, "You need to be at least level " .. settingData.minLevel .. " to enter this portal.")
        player:teleportTo(fromPosition, true)
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        return true
    end

    if settingData.needVip and not player:isVip() then
        player:sendTextMessage(MESSAGE_STATUS, "You need to be a VIP to enter this portal.")
        player:teleportTo(fromPosition, true)
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        return true
    end

    if settingData.requiredKeyValue and not player:kv():get(settingData.requiredKeyValue) then
        player:sendTextMessage(MESSAGE_STATUS, "You need to have access to enter this portal.")
        player:teleportTo(fromPosition, true)
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        return true
    end

    local teleportPosition = settingData.position
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:teleportTo(teleportPosition)
    teleportPosition:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

teleportLocationsEvent:type("stepin")

for index, _ in pairs(setting) do
    teleportLocationsEvent:aid(index)
end

teleportLocationsEvent:register()
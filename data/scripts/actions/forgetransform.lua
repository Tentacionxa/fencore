local config = {
    ['forgeDust'] = {
        sliverId = 37109, -- Item ID for slivers
        dustPerSliver = 15, -- Amount of dust needed per conversion
        sliversPerConversion = 3 -- Amount of slivers per conversion
    }
}

local convertMaterial = Action()

function convertMaterial.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return false end

    local dustAmount = player:getForgeDusts() -- Get the player's current forge dusts

    if dustAmount < config.forgeDust.dustPerSliver then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need at least 15 dusts to convert.")
        return false
    end

    local conversions = math.floor(dustAmount / config.forgeDust.dustPerSliver)
    local sliversToAdd = conversions * config.forgeDust.sliversPerConversion
    local dustToRemove = conversions * config.forgeDust.dustPerSliver

    -- Remove the dust using the function from forge_functions.lua
    player:removeForgeDusts(dustToRemove)

    -- Add slivers to the player's backpack
    player:addItem(config.forgeDust.sliverId, sliversToAdd)

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You converted ' .. dustToRemove .. ' forge dusts into ' .. sliversToAdd .. ' slivers.')
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)

    return true
end

convertMaterial:id(49271) -- Hammer action
convertMaterial:register()
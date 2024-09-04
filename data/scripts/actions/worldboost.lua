local config = {
    basinPosition = Position(32361, 32224, 7),
    basinEmpty = 25661,
    basinFull = 25660,
    boostTime = 86400, --seconds
    boostStorage = 480664,
    boostActionId = 45535, --give it to the item/basin/shrine that will activate the boost
    boostCost = 200000000,
    effectOn = 206,
    effectOff = 6,
    textcolor = "", --optional for OTC users
    textBoostHasEnded = "World XP+Skill+Loot boost has ended.",
    textNotEnoughResources = "You don\'t have enough resources to activate world XP+Skill+Loot boost.",
    textAlreadyActive = "World XP+Skill+Loot boost is already active.",
}

local function reset()
local basin = Tile(config.basinPosition):getItemById(config.basinFull)
    if basin then
        basin:transform(config.basinEmpty)
        basin:getPosition():sendMagicEffect(config.effectOff)
        basin:getPosition():sendAnimatedText(config.textBoostHasEnded)
        broadcastMessage(config.textBoostHasEnded .. " {#"..config.textcolor.."}", MESSAGE_STATUS_WARNING)
    else
        print("World Boost reset event error: cannot locate the basin.")
    end
end


local worldBoostExp = Action()

function worldBoostExp.onUse(player, item, fromPosition, target, toPosition, isHotkey)
if item:getId() == config.basinEmpty then
    if getGlobalStorageValue(config.boostStorage) < os.time() then
        if player:removeMoneyBank(config.boostCost) == true then
            setGlobalStorageValue(config.boostStorage, os.time() + config.boostTime)
            broadcastMessage(player:getName() .. " has activated the global double XP+Skill+Loot boost until the next server restart.", MESSAGE_STATUS_WARNING)          
item:transform(config.basinFull)
            item:getPosition():sendMagicEffect(config.effectOn)
            -- item:getPosition():sendAnimatedText("Double XP boost has been activated.")
            local event = addEvent(reset, config.boostTime * 1000, config.basinPosition)
            basinStartCountdown()
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.textNotEnoughResources)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    end
else
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.textAlreadyActive)
    player:getPosition():sendMagicEffect(CONST_ME_POFF)
end
    return
end

worldBoostExp:aid(config.boostActionId)
worldBoostExp:register()

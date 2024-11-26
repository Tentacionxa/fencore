local templeScroll = Action()

function templeScroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Check if the player is in the Bomberman event
    if BOMBERMAN_PLAYERS[player:getId()] then
        player:sendCancelMessage("You cannot use the scroll while participating in the Bomberman event.")
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- Check if the player is in a protection zone or not in a fight
    local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
    local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
    if inPz or not inFight then
        fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(player:getTown():getTemplePosition())
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        item:remove()
    else
        player:sendCancelMessage("You can't use this when you're in a fight.")
        fromPosition:sendMagicEffect(CONST_ME_POFF)
    end
    return true
end

templeScroll:id(25718)
templeScroll:register()

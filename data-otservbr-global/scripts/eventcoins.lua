local addCoins = Action()

function addEventPoints(player, points)
    local accountId = player:getAccountId()
    db.query("UPDATE `accounts` SET `coins_event` = `coins_event` + " .. points .. " WHERE `id` = " .. accountId .. ";")
end

function addCoins.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local points = item:getCount()
    addEventPoints(player, points)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. points .. " Event Points")
    item:remove(item:getCount())
    return true
end

addCoins:id(24390)
addCoins:register()

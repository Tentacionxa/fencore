local addCoins = Action()

function addPremiumPoints(player, points)
    local accountId = player:getAccountId()
    db.query("UPDATE `accounts` SET `coins_transferable` = `coins_transferable` + " .. points .. " WHERE `id` = " .. accountId .. ";")
end

function addCoins.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local points = item:getCount()
    addPremiumPoints(player, points)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received " .. points .. " Transferable Coins")
    item:remove(item:getCount())
    return true
end

addCoins:id(22118)
addCoins:register()

local refill = TalkAction("!refill")

local chargeItem = {
    ["pendulet"] = { noChargeID = 29429, ChargeID = 30344, cost = 75000 },
    ["sleep shawl"] = { noChargeID = 29428, ChargeID = 30342, cost = 75000 },
    ["blister ring"] = { noChargeID = 31621, ChargeID = 31557, cost = 75000 },
    ["theurgic amulet"] = { noChargeID = 30401, ChargeID = 30403, cost = 75000 },
    ["ring of souls"] = { noChargeID = 32636, ChargeID = 32621, cost = 75000 },
    ["turtle amulet"] = { noChargeID = 39235, ChargeID = 39233, cost = 75000 },
    ["spiritthorn ring"] = { noChargeID = 39179, ChargeID = 39177, cost = 75000 },
    ["alicorn ring"] = { noChargeID = 39182, ChargeID = 39180, cost = 75000 },
    ["arcanomancer sigil"] = { noChargeID = 39185, ChargeID = 39183, cost = 75000 },
    ["arboreal ring"] = { noChargeID = 39188, ChargeID = 39187, cost = 75000 },
    ["worn soft boots"] = { noChargeID = 6530, ChargeID = 6529, cost = 75000 },
    ["worn firewalker boots"] = { noChargeID = 9020, ChargeID = 9019, cost = 75000 },
}

function refill.onSay(player, words, param)
    local exhaustGroup = "talkactions"
    local exhaustTime = 2 -- 2 seconds exhaust (2000 ms)

    -- Check if the player is exhausted for this command
    if player:getExhaustion(exhaustGroup) > 0 then
        player:sendCancelMessage("You are exhausted. Please wait before using this command again.")
        return false
    end

    local refilledItems = {}
    local totalCost = 0
    for itemName, itemData in pairs(chargeItem) do
        local chargeableCount = player:getItemCount(itemData.noChargeID)
        if chargeableCount >= 1 then
            totalCost = totalCost + itemData.cost
            table.insert(refilledItems, itemName)
            player:removeMoneyBank(itemData.cost)
            player:removeItem(itemData.noChargeID, 1)
            player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
            player:addItemStoreInboxEx(Game.createItem(itemData.ChargeID, 1), 1, self)
        end
    end
    if #refilledItems == 0 then
        player:sendTextMessage(MESSAGE_LOOK, "You do not have any items to refill or money in your bank account.")
    else
        local itemList = table.concat(refilledItems, ", ")
        player:sendTextMessage(MESSAGE_LOOK, "Refilled " .. itemList .. " for a total of " .. totalCost .. " gp.")
    end

    -- Set the exhaust for 2 seconds
    player:setExhaustion(exhaustGroup, exhaustTime)
    return true
end

refill:separator(" ")
refill:groupType("normal")
refill:register()

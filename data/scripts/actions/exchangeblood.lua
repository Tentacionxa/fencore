local changeCoins = Action()

local config = {
    coinId = 3043,
    changeTo = 46316,
    requiredAmount = 100,
    requiredAmount2 = 1000,
    requiredAmount3 = 10000, -- Added requiredAmount3 for 100 blood coins
    giveAmount = 1,
    giveAmount2 = 10,
    giveAmount3 = 100
}

function changeCoins.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    player:registerEvent("modalExchange")

    -- Create modal window
    local modal = ModalWindow(0, "Blood Exchange")
    modal:addChoice(1, "1 kk = 1 blood coin")
    modal:addChoice(2, "10 kk = 10 blood coins")
    modal:addChoice(3, "100 kk = 100 blood coins")
    modal:addButton(0, "Accept")
    modal:addButton(1, "Cancel")
    modal:setDefaultEnterButton(0)
    modal:setDefaultEscapeButton(1)
    modal:sendToPlayer(player)

    return true
end

changeCoins:id(46087,46088)  -- ID of the statue/item
changeCoins:register()

local modalExchange = CreatureEvent("modalExchange")

function modalExchange.onModalWindow(player, modalWindowId, buttonId, choiceId)

    player:unregisterEvent("modalExchange")

    if buttonId == 0 then  -- 'Accept' button pressed
        if choiceId == 1 then  -- Exchange 100 Crystal Coins for 1 Blood Coin
            if player:getItemCount(config.coinId) >= config.requiredAmount then
                if player:removeItem(config.coinId, config.requiredAmount) then
                    player:addItem(config.changeTo, config.giveAmount)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have exchanged 100 Crystal Coins for 1 blood coin.")
                else
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Exchange was not successful. Please check if you have enough coins.")
                end
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough Crystal Coins for this exchange.")
            end
        elseif choiceId == 2 then  -- Exchange 1000 Crystal Coins for 10 Blood Coins
            if player:getItemCount(config.coinId) >= config.requiredAmount2 then
                if player:removeItem(config.coinId, config.requiredAmount2) then
                    player:addItem(config.changeTo, config.giveAmount2)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have exchanged 1000 Crystal Coins for 10 blood coins.")
                else
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Exchange was not successful. Please check if you have enough coins.")
                end
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough Crystal Coins for this exchange.")
            end
        elseif choiceId == 3 then  -- Exchange 10000 Crystal Coins for 100 Blood Coins
            if player:getItemCount(config.coinId) >= config.requiredAmount3 then
                if player:removeItem(config.coinId, config.requiredAmount3) then
                    player:addItem(config.changeTo, config.giveAmount3)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have exchanged 10000 Crystal Coins for 100 blood coins.")
                else
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Exchange was not successful. Please check if you have enough coins.")
                end
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough Crystal Coins for this exchange.")
            end
        end
    else  -- 'Cancel' button pressed
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Exchange Cancelled.")
    end

    return true
end

modalExchange:type("modalwindow")
modalExchange:register()
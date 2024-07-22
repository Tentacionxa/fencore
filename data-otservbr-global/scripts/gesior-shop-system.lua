-- ### CONFIG ###
-- message to player "type", if delivery of item debugs client, it can be because of undefinied type (type that does not exist in your server LUA)
SHOP_MSG_TYPE = MESSAGE_EVENT_ADVANCE
-- ### END OF CONFIG ###

local shop = GlobalEvent("shop")

function shop.onThink(interval)
    local resultId = db.storeQuery("SELECT * FROM z_ots_comunication")
    if not resultId then
        return true
    end

    repeat
        local transactionId = result.getDataInt(resultId, "id")
        local player = Player(result.getDataString(resultId, "name"))

        if player then
            local itemId = tonumber(result.getDataString(resultId, "param1"))
            local itemCount = tonumber(result.getDataString(resultId, "param2"))
            local containerId = tonumber(result.getDataString(resultId, "param3"))
            local containerItemsInsideCount = tonumber(result.getDataString(resultId, "param4"))
            local shopOfferType = result.getDataString(resultId, "param5")
            local shopOfferName = result.getDataString(resultId, "param6")
            local receivedItemStatus = RETURNVALUE_NOERROR
            local newItem = nil

            if shopOfferType == 'item' then
                newItem = Game.createItem(itemId, itemCount)
                if not newItem then
                    player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                    print('ERROR! Website Shop (' .. player:getName() .. ') - cannot create item - invalid item ID OR count - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                    return true
                end
            elseif shopOfferType == 'container' then
                newItem = Game.createItem(containerId, 1)
                if not newItem or not Container(newItem.uid) then
                    player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                    print('ERROR! Website Shop (' .. player:getName() .. ') - cannot create container - invalid container ID - CONTAINER ID:' .. containerId)
                    return true
                end

                for i = 1, containerItemsInsideCount do
                    local item = Game.createItem(itemId, itemCount)
                    if not item then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                        print('ERROR! Website Shop (' .. player:getName() .. ') - cannot create item - invalid item ID OR count - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                        return true
                    end

                    local addItemToContainerResult = newItem:addItemEx(item)
                    if type(addItemToContainerResult) ~= "number" or addItemToContainerResult ~= RETURNVALUE_NOERROR then
                        player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                        print('ERROR! Website Shop (' .. player:getName() .. ') - cannot add item to container - item is not pickable OR variable "RETURNVALUE_NOERROR" is not definied in LUA - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount)
                        return true
                    end
                end
            end

            local playerStoreInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
            if not playerStoreInbox then
                player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                print('ERROR! Website Shop (' .. player:getName() .. ') - cannot open player "Store Inbox" - it is not supported in your server OR variable "CONST_SLOT_STORE_INBOX" is not definied in LUA')
                return true
            end

            receivedItemStatus = playerStoreInbox:addItemEx(newItem)
            if type(receivedItemStatus) == "number" and receivedItemStatus == RETURNVALUE_NOERROR then
                player:sendTextMessage(SHOP_MSG_TYPE, 'You received ' .. shopOfferName .. ' from Website Shop. You can find your item in STORE INBOX (under EQ).')
                db.asyncQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. transactionId)
                db.asyncQuery("UPDATE `z_shop_history_item` SET `trans_state`= 'realized', `trans_real`=" .. os.time() .. " WHERE `id` = " .. transactionId)
            else
                player:sendTextMessage(SHOP_MSG_TYPE, 'Website Shop bugged. Contact with administrator! Error is visible in server console.')
                print('ERROR! Website Shop (' .. player:getName() .. ') - cannot add container with items to STORE INBOX - unknown reason, is it\'s size limited and it is full? - ITEM ID: ' .. itemId .. ', ITEM COUNT: ' .. itemCount .. ', CONTAINER ID:' .. containerId .. ', ITEMS IN CONTAINER COUNT:' .. containerItemsInsideCount)
            end
        end
    until not result.next(resultId)

    result.free(resultId)
    return true
end

shop:interval(30000) -- how often to randomize rain / weather
shop:register()
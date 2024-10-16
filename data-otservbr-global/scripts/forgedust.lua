local dust = Action()

function dust.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemId = 49181 -- ID of the item to be transformed into dusts
    local amountPerItem = 1 -- Amount of dusts each item provides
    local totalDusts = player:getForgeDusts()
    local limitDusts = 100 -- Maximum amount of dusts allowed
    local itemCount = player:getItemCount(itemId) -- Count of item ID 49181 the player has

    -- Calculate how many dusts can be added without exceeding the limit
    local availableDusts = limitDusts - totalDusts
    local dustToAdd = math.min(itemCount, availableDusts)

    if dustToAdd > 0 then
        player:addForgeDusts(dustToAdd)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You gained " .. dustToAdd .. " dusts.")
        
        -- Remove the corresponding number of items from the player's inventory
        player:removeItem(itemId, dustToAdd)
        
        return true
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot add more Forge Dusts. Limit reached.")
    end
end

dust:id(49181) -- ID of the item to be transformed into dusts
dust:register()
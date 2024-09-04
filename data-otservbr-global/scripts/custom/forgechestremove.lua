local emptybps = Action()
local playerDelay = {}

function emptybps.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not playerDelay[player:getId()] then
        playerDelay[player:getId()] = true
        
        local toRemove = {}
        local removed = false
        
        for _, itemZ in ipairs(player:getSlotItem(CONST_SLOT_STORE_INBOX):getItems(true)) do
            if itemZ:getId() == 37561 and itemZ:getEmptySlots() == 2 then
                toRemove[itemZ] = itemZ
            end
        end

        for k,v in pairs(toRemove) do
            v:remove()
            removed = true
        end

        if removed then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You cleaned your store inbox.')
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have no forge chests in Your store inbox.')
        end

        addEvent(function(pid) 
            playerDelay[pid] = false
        end, 2000, player:getId())
    end
    return true
end

emptybps:uid(26999,36999)
emptybps:register()

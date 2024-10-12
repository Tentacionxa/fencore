local createWeaponAction = Action()

-- Configurable data for the script
local config = {
    requiredLevel = 3000,
    weaponChoices = {
        {id = 43878, name = "Grand Sanguine Bow"},  -- Example weapons, adjust as necessary
        {id = 43880, name = "Grand Sanguine Crossbow"},
        {id = 43871, name = "Grand Sanguine Razor"},
        {id = 43865, name = "Grand Sanguine Blade"},
        {id = 43875, name = "Grand Sanguine Battleaxe"},
        {id = 43869, name = "Grand Sanguine Hatchet"},
        {id = 43873, name = "Grand Sanguine Bludgeon"},
        {id = 43867, name = "Grand Sanguine Cudgel"},
        {id = 43886, name = "Grand Sanguine Rod"},
        {id = 43883, name = "Grand Sanguine Coil"},
    },
    requiredItems = {43864, 43866, 43868, 43870, 43872, 43874, 43877, 43879, 43882, 43885},  -- List of item IDs player needs one of to craft
    itemCount = 8  -- Amount of the weapon to create
}

-- Function to check if the player has one of the required items
local function getRequiredItem(player)
    for _, itemId in ipairs(config.requiredItems) do
        if player:getItemCount(itemId) > 0 then
            return itemId
        end
    end
    return nil
end

-- Action on using the item to trigger the modal window
function createWeaponAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getLevel() < config.requiredLevel then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need at least level " .. config.requiredLevel .. " to use this item.")
        return true
    end

    local requiredItem = getRequiredItem(player)
    if not requiredItem then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the required item to craft a weapon.")
        return true
    end

    -- Create modal window for weapon selection
    local modal = ModalWindow(1000, "Choose your weapon")
    for i, weapon in ipairs(config.weaponChoices) do
        modal:addChoice(i, weapon.name)
    end
    modal:addButton(100, "Create")
    modal:addButton(101, "Cancel")
    modal:setDefaultEnterButton(100)
    modal:setDefaultEscapeButton(101)
    modal:sendToPlayer(player)

    player:setStorageValue(1000, requiredItem)  -- Store the ID of the item to remove later
    player:registerEvent("modalWeaponCreate")
    return true
end

createWeaponAction:id(46378)  -- ID of the item to trigger the action
createWeaponAction:register()

-- Modal window event handling
local modalWeaponCreate = CreatureEvent("modalWeaponCreate")

function modalWeaponCreate.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("modalWeaponCreate")

    if buttonId == 100 then  -- "Create" button pressed
        local selectedWeapon = config.weaponChoices[choiceId]
        if not selectedWeapon then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid weapon selection.")
            return true
        end

        if player:getLevel() < config.requiredLevel then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough levels.")
            return true
        end

        local requiredItem = player:getStorageValue(1000)  -- Get the stored required item ID
        if requiredItem ~= -1 and player:removeItem(requiredItem, 1) and player:removeItem(46378, 1) then  -- Remove one of the required items
            player:setLevel(player:getLevel() - 500)  -- Remove 500 levels 
            player:addItem(selectedWeapon.id, config.itemCount)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have crafted 8 " .. selectedWeapon.name .. "s.")
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have the required item to craft the weapon.")
        end
    end
    return true
end

modalWeaponCreate:register()

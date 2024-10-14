-- Main Crafting Window -- This is the modal window that is displayed first 
function Player:sendMainCraftWindow(config)
	local function buttonCallback(player, button, choice)
 
	-- Modal Window Functionallity 
		if button.name == "Select" then
			self:sendVocCraftWindow(config, choice.id)
		end	
	end
 
	-- Modal window design
	local window = ModalWindow {
		title = config.mainTitleMsg, -- Title of the main craft modal window
		message = config.mainMsg.."\n\n" -- Message of the main craft modal window
	}
 
	-- Add buttons to the window (Note: if you change the names of these you must change the functions in the modal window functionallity!)
	window:addButton("Select", buttonCallback)
	window:addButton("Exit", buttonCallback)
 
	-- Add choices from the action script
    for i = 1, #config.system do
		window:addChoice(config.system[i].vocation)
    end
 
	-- Set what button is pressed when the player presses enter or escape.
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
 
	-- Send the window to player
	window:sendToPlayer(self)
end
-- End of the first modal window
 
 
 
-- This is the modal window that displays all avalible items for the chosen vocation.
function Player:sendVocCraftWindow(config, lastChoice)
    local function buttonCallback(player, button, choice)
 
-- Modal Window Functionallity 
		-- If the user presses the back button they will be redirected to the main window.
		if button.name == "Back" then
			self:sendMainCraftWindow(config)
		end
		-- If the user presses the details button they will be redirected to a text window with information about the item they want to craft.
		if button.name == "Details" then
		local item = config.system[lastChoice].items[choice.id].item
		local details = "In order to craft "..item.." you must collect the following items.\n\nRequired Items:"
 
			for i = 1, #config.system[lastChoice].items[choice.id].reqItems do
			local reqItems = config.system[lastChoice].items[choice.id].reqItems[i].item
			local reqItemsCount = config.system[lastChoice].items[choice.id].reqItems[i].count 
			local reqItemsOnPlayer = self:getItemCount(config.system[lastChoice].items[choice.id].reqItems[i].item)
				details = details.."\n- "..capAll(getItemName(reqItems).." ["..reqItemsOnPlayer.."/"..reqItemsCount.."]")
			end 
			self:sendVocCraftWindow(config, lastChoice)
			self:showTextDialog(item, details)
		end
 
		-- if the player presses the craft button then begin checks. 
		if button.name == "Craft" then
			-- Check if player has required items to craft, excluding equipped items
			for i = 1, #config.system[lastChoice].items[choice.id].reqItems do
				local reqItem = config.system[lastChoice].items[choice.id].reqItems[i].item
				local reqItemCount = config.system[lastChoice].items[choice.id].reqItems[i].count
		
				-- Count all items excluding equipped items manually
				local totalItemCount = self:getItemCount(reqItem)
				local equippedCount = 0
		
				-- Check equipped slots to determine how many of the required items are equipped
				local slots = {
					CONST_SLOT_HEAD,
					CONST_SLOT_NECKLACE,
					CONST_SLOT_ARMOR,
					CONST_SLOT_RIGHT,
					CONST_SLOT_LEFT,
					CONST_SLOT_LEGS,
					CONST_SLOT_FEET,
					CONST_SLOT_RING,
					CONST_SLOT_AMMO
				}
		
				for _, slot in ipairs(slots) do
					local equippedItem = self:getSlotItem(slot)
					if equippedItem and equippedItem:getId() == reqItem then
						equippedCount = equippedCount + equippedItem:getCount()
					end
				end
		
				-- Calculate the available count by subtracting the equipped count from the total count
				local availableItemCount = totalItemCount - equippedCount
		
				-- If the available count is less than the required count, notify the player and stop crafting
				if availableItemCount < reqItemCount then
					self:say(config.needItems .. config.system[lastChoice].items[choice.id].item, TALKTYPE_MONSTER_SAY)
					return false
				end
			end
		
			-- Remove the required items from the player's backpack and inventory, excluding equipped items
			for i = 1, #config.system[lastChoice].items[choice.id].reqItems do
				local reqItem = config.system[lastChoice].items[choice.id].reqItems[i].item
				local reqItemCount = config.system[lastChoice].items[choice.id].reqItems[i].count
				local removedCount = 0
		
				-- Remove items from backpack and inventory slots only, avoiding equipped slots
				local backpack = self:getSlotItem(CONST_SLOT_BACKPACK)
				if backpack and backpack:isContainer() then
					local containerSize = backpack:getSize()
					for j = 0, containerSize - 1 do
						local item = backpack:getItem(j)
						if item and item:getId() == reqItem and removedCount < reqItemCount then
							local toRemove = math.min(item:getCount(), reqItemCount - removedCount)
							self:removeItem(reqItem, toRemove)
							removedCount = removedCount + toRemove
						end
					end
				end
			end
		
			-- Send effect and give player the crafted item
			self:addItem(config.system[lastChoice].items[choice.id].itemID)
			self:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
		end
	end
	-- Modal window design
    local window = ModalWindow {
        title = config.craftTitle..config.system[lastChoice].vocation, -- The title of the vocation specific window
        message = config.craftMsg..config.system[lastChoice].vocation..".\n\n", -- The message of the vocation specific window
    }
 
	-- Add buttons to the window (Note: if you change the names of these you must change the functions in the modal window functionallity!)
	window:addButton("Back", buttonCallback)
	window:addButton("Exit")
	window:addButton("Details", buttonCallback)
	window:addButton("Craft", buttonCallback)
 
	-- Set what button is pressed when the player presses enter or escape
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(1)
 
	-- Add choices from the action script
    for i = 1, #config.system[lastChoice].items do
        window:addChoice(config.system[lastChoice].items[i].item)
    end
 
	-- Send the window to player
    window:sendToPlayer(self)
end

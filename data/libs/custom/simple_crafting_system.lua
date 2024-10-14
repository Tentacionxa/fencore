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
 
			-- Check if player has required items to craft the item. If they dont send needItems message.
			for i = 1, #config.system[lastChoice].items[choice.id].reqItems do
				if self:getItemCount(config.system[lastChoice].items[choice.id].reqItems[i].item) < config.system[lastChoice].items[choice.id].reqItems[i].count then
					self:say(config.needItems..config.system[lastChoice].items[choice.id].item, TALKTYPE_MONSTER_SAY)
					return false
				end
			end	
			-- Remove the required items and there count from the player.
			for i = 1, #config.system[lastChoice].items[choice.id].reqItems do
				self:removeItem(config.system[lastChoice].items[choice.id].reqItems[i].item, config.system[lastChoice].items[choice.id].reqItems[i].count)
			end				
		-- Send effect and give player item.
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
local config = {
	{ itemId = 46310, mountId = 232 }, -- Example: Ursagrodon
	{ itemId = 46279, mountId = 234 },
	{ itemId = 46278, mountId = 235 },
	{ itemId = 46325, mountId = 236 },
	{ itemId = 46322, mountId = 237 },
	{ itemId = 46323, mountId = 238 },
	{ itemId = 46324, mountId = 239 },
	{ itemId = 46285, mountId = 240 },
	porcentagem = 30 -- Percentage chance of success
}

local function revertIce(toPosition, itemId)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(itemId)
		if thing then
			thing:transform(itemId)
		end
	end
end

local griishmount = Action()

function griishmount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local rand = math.random(1, 100)

	-- Iterate over the config to find the item being used
	for _, entry in ipairs(config) do
		if item.itemid == entry.itemId then
			-- Check if the player already has the mount
			if player:hasMount(entry.mountId) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have this mount.")
				return true
			end

			-- Handle success or failure of unlocking the mount
			if rand <= config.porcentagem then
				player:addMount(entry.mountId)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have unlocked a new Griish mount!")
				item:remove(1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The attempt failed. Try again!")
			end

			return true
		end
	end

	return false
end

-- Register the action for all the item IDs in the config
for _, entry in ipairs(config) do
	griishmount:id(entry.itemId)
end

griishmount:register()


local config = {
	{ itemId = 46310, mountId = 1321 }, -- Example: Ursagrodon
	{ itemId = 46323, mountId = 168 },  -- Replace with actual items and mounts
	{ itemId = 46279, mountId = 181 },
	{ itemId = 46278, mountId = 182 },
	{ itemId = 46325, mountId = 707 },
	{ itemId = 46322, mountId = 708 },
	{ itemId = 46323, mountId = 709 },
	{ itemId = 46324, mountId = 710 },
	{ itemId = 46285, mountId = 704 },
	porcentagem = 30 -- Percentage chance of success
}

local function revertIce(toPosition, itemId)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(itemId)
		if thing then
			thing:transform(itemId)
		end
	end
end

local griishmount = Action()

function griishmount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local rand = math.random(1, 100)

	-- Iterate over the config to find the item being used
	for _, entry in ipairs(config) do
		if item.itemid == entry.itemId then
			-- Check if the player already has the mount associated with this item
			if player:hasMount(entry.mountId) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already have this mount.")
				return true
			end

			-- Handle success or failure based on percentage chance
			if rand <= config.porcentagem then
				-- Unlock the specific mount for this item
				player:addMount(entry.mountId)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have unlocked a new Griish mount!")
				item:remove(1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The attempt failed. Try again!")
			end

			return true
		end
	end

	return false
end

-- Register the action for all the item IDs in the config
for _, entry in ipairs(config) do
	griishmount:id(entry.itemId)
end

griishmount:register()

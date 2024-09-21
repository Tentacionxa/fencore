local supremeCube = Action()

local config = {
    price = 50000,
    storage = 9009,
    cooldown = 60,
    towns = {
	
	}
}

local function supremeCubeMessage(player, effect, message)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
    player:getPosition():sendMagicEffect(effect)
end

local function windowChoice(window, player, town)
    window:addChoice(town.name, function(player, button, choice)
        if button.name == "Select" then
            player:teleportTo(town.teleport, true)
            player:removeMoneyBank(config.price)
            supremeCubeMessage(player, CONST_ME_TELEPORT, "Welcome to " .. town.name)
            player:setStorageValue(config.storage, os.time() + config.cooldown)
        end
        return true
    end)
end

function supremeCube.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
    local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
    local house = player:getHouse()

    if not inPz and inFight then
        supremeCubeMessage(player, CONST_ME_POFF, "You can't use this when you're in a fight.")
        return false
    end

    if player:getMoney() + player:getBankBalance() < config.price then
        supremeCubeMessage(player, CONST_ME_POFF, "You don't have enought money.")
        return false
    end

    if player:getStorageValue(config.storage) > os.time() then
        local remainingTime = player:getStorageValue(config.storage) - os.time()
        supremeCubeMessage(player, CONST_ME_POFF, "You can use it again in: " .. remainingTime .. " seconds.")
        return false
    end

	local window = ModalWindow({
        title = "Supreme Cube",
        message = "Select a City - Price: " .. config.price .. "gold.",
    })

    if house ~= nil then
        windowChoice(window, player, { name = "House", teleport = house:getExitPosition() })
    end

    for _, town in pairs(config.towns) do
        if town.name then
            windowChoice(window, player, town)
        end
    end

    window:addButton("Select")
    window:addButton("Close")
    window:setDefaultEnterButton(0)
    window:setDefaultEscapeButton(1)
    window:sendToPlayer(player)

    return true
end

supremeCube:id(19361)
supremeCube:register()

local config = {
    actionId = 18563,  -- ActionID da alavanca
    requiredItemId = 37317, 
    positions = {
        {x = 32345, y = 32219, z = 4}, -- Posição inicial
        {x = 32346, y = 32219, z = 4},
        {x = 32347, y = 32219, z = 4},
        {x = 32348, y = 32219, z = 4},
        {x = 32349, y = 32219, z = 4}, -- Posição final (centro)
        {x = 32350, y = 32219, z = 4},
        {x = 32351, y = 32219, z = 4},
        {x = 32352, y = 32219, z = 4},
        {x = 32353, y = 32219, z = 4}  -- Posição Final
    },
    items = {
        {id = 24390, count = 150, chance = 10},
        {id = 3389, count = 1, chance = 1, raro = true},
        {id = 3079, count = 1, chance = 1, raro = true},
		{id = 3079, count = 100, chance = 1, raro = true},
		{id = 943, count = 50, chance = 1, raro = true},
		{id = 24390, count = 150, chance = 10,},
        {id = 3043, count = 100, chance = 4},
        {id = 14758, count = 25, chance = 8},
        {id = 36728, count = 1, chance = 4},
        {id = 36727, count = 1, chance = 2},
        {id = 36725, count = 1, chance = 1},
        {id = 12812, count = 1, chance = 1},
        {id = 3363, count = 1, chance = 5},
    }
}

local isRouletteRunning = false

local function addItemToPlayer(player, item)
    player:addItem(item.id, item.count)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Legal! Ganhou um " .. ItemType(item.id):getName() .. "!")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    if item.raro then
        Game.broadcastMessage(player:getName() .. " ganhou um item raro: " .. ItemType(item.id):getName() .. " na roleta!", MESSAGE_EVENT_ADVANCE)
    end
end

local function getRandomItem()
    local totalWeight = 0
    for _, item in ipairs(config.items) do
        totalWeight = totalWeight + item.chance
    end

    local randomWeight = math.random() * totalWeight
    local cumulativeWeight = 0
    for _, item in ipairs(config.items) do
        cumulativeWeight = cumulativeWeight + item.chance
        if randomWeight <= cumulativeWeight then
            return item
        end
    end
end

local function moveItems()
    for i = #config.positions, 2, -1 do
        local tile = Tile(config.positions[i - 1])
        local item = tile and tile:getTopDownItem()
        if item then
            item:moveTo(config.positions[i])
            Position(config.positions[i]):sendMagicEffect(CONST_ME_MAGIC_GREEN)
        end
    end
end

local function clearItems()
    for _, pos in ipairs(config.positions) do
        local tile = Tile(Position(pos))
        if tile then
            local item = tile:getTopDownItem()
            while item do
                item:remove()
                item = tile:getTopDownItem()
            end
        end
    end
end

local function createItemWithEffect(position, item)
    Game.createItem(item.id, item.count, Position(position))
    Position(position):sendMagicEffect(CONST_ME_MAGIC_BLUE)
end

local function getItemConfigById(itemId)
    for _, item in ipairs(config.items) do
        if item.id == itemId then
            return item
        end
    end
    return nil
end

local function rouletteAction(player)
    isRouletteRunning = true
    local steps = 10 + math.random(5, 10)  -- Número de passos que a roleta dará antes de parar
    local interval = 100  -- Intervalo

    local currentItem = getRandomItem()
    createItemWithEffect(config.positions[1], currentItem)

    for i = 1, steps do
        addEvent(function()
            moveItems()
            if i == steps then
                local winningItem = Tile(Position(config.positions[5])):getTopDownItem()
                if winningItem then
                    clearItems()
                    for _, pos in ipairs(config.positions) do
                        createItemWithEffect(pos, {id = winningItem:getId(), count = winningItem:getCount()})
                    end
                    local itemConfig = getItemConfigById(winningItem:getId())
                    addItemToPlayer(player, itemConfig)
                end
                isRouletteRunning = false
            else
                local lastPositionTile = Tile(Position(config.positions[#config.positions]))
                if lastPositionTile then
                    local lastItem = lastPositionTile:getTopDownItem()
                    if lastItem then
                        lastItem:remove()
                        Position(config.positions[#config.positions]):sendMagicEffect(CONST_ME_POFF)
                    end
                end
                currentItem = getRandomItem()
                createItemWithEffect(config.positions[1], currentItem)
            end
        end, i * interval)

        -- Aumentar o intervalo para simular a desaceleração
        interval = interval + 50
    end
end

local rouletteLever = Action()

function rouletteLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if isRouletteRunning then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Roulette working. Please wait.")
        return false
    end

    if item.actionid == config.actionId then
        if player:removeItem(config.requiredItemId, 1) then
            clearItems()
            rouletteAction(player)
            return true
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need a Casino Coin to trigger the roulette wheel")
            return false
        end
    end
    return false
end

rouletteLever:aid(config.actionId)
rouletteLever:register()
local config = {
    actionId = 18436,
    lever = {
        left = 8911,
        right = 8912
    },
    playItem = {
        itemId = 3043,
        count = 500
    },
    winCondition = {
        matchingItemsCount = 3, -- liczba elementów wymaganych do wygranej
    },
    prizePool = {
        {itemId = 36725, count = {2, 3},   chance = 1},
        {itemId = 36726, count = {2, 3},    chance = 2 },
        {itemId = 36728, count = {2, 3},    chance = 4 },
        {itemId = 36727, count = {2, 3},    chance = 4 },
		{itemId = 3043, count = {300, 300},    chance = 10 },
    },
    roulettePositions = { 
        Position(33462, 32491, 13), -- 1
        Position(33463, 32491, 13), -- 2
        Position(33464, 32491, 13), -- 3
        Position(33462, 32492, 13), -- 4
        Position(33463, 32492, 13), -- 5
        Position(33464, 32492, 13), -- 6
        Position(33462, 32493, 13), -- 7
        Position(33463, 32493, 13), -- 8
        Position(33464, 32493, 13), -- 9
    },
    animation = {
        spinTime = 10, -- czas trwania animacji w sekundach
        slowdownRate = 1.2 -- stopniowe zwalnianie animacji
    }
}

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function checkWinCondition()
    local positions = config.roulettePositions
    local symbols = {}

    -- Zbieranie symboli z każdej pozycji
    for i = 1, #positions do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item then
            symbols[i] = item:getId()
        else
            symbols[i] = nil
        end
    end

    -- Sprawdzenie wygranych kombinacji (3 w jednej linii)
    local winningLines = {
        {1, 2, 3}, -- poziomo górny rząd
        {4, 5, 6}, -- poziomo środkowy rząd
        {7, 8, 9}, -- poziomo dolny rząd
        {1, 4, 7}, -- pionowo lewa kolumna
        {2, 5, 8}, -- pionowo środkowa kolumna
        {3, 6, 9}, -- pionowo prawa kolumna
        {1, 5, 9}, -- przekątna z lewej do prawej
        {3, 5, 7}  -- przekątna z prawej do lewej
    }

    local prizeItemId = nil
    for _, line in ipairs(winningLines) do
        if symbols[line[1]] and symbols[line[1]] == symbols[line[2]] and symbols[line[1]] == symbols[line[3]] then
            prizeItemId = symbols[line[1]]
            break
        end
    end

    return prizeItemId
end

local function chanceNewReward()
    local newItemInfo = {itemId = 0, count = 0}

    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end

    local rand = math.random(#rewardTable)
    newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
    newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])

    return newItemInfo
end

-- Funkcja obsługująca animację i przesuwanie symboli
local function spinAnimation(playerId, leverPosition, remainingTime, delay)
    if remainingTime <= 0 then
        return
    end

    -- Przesuwanie symboli z dodaniem efektów magicznych
    local lastItem = Tile(config.roulettePositions[9]):getTopVisibleThing()
    for i = #config.roulettePositions, 2, -1 do
        local fromPosition = config.roulettePositions[i - 1]
        local toPosition = config.roulettePositions[i]

        local item = Tile(fromPosition):getTopVisibleThing()
        if item then
            item:moveTo(toPosition)
            toPosition:sendMagicEffect(math.random(CONST_ME_GIFT_WRAPS, CONST_ME_FIREWORK_BLUE)) -- dodanie losowego efektu magicznego
        end
    end

    -- Dodanie nowego symbolu w pierwszej pozycji
    local newItemInfo = chanceNewReward()
    Game.createItem(newItemInfo.itemId, newItemInfo.count, config.roulettePositions[1])
    config.roulettePositions[1]:sendMagicEffect(math.random(CONST_ME_GIFT_WRAPS, CONST_ME_FIREWORK_BLUE)) -- efekt magiczny przy dodaniu nowego symbolu

    -- Dodanie przedmiotu do 9 pozycji, aby kontynuować animację
    if lastItem then
        Game.createItem(lastItem:getId(), lastItem:getCount(), config.roulettePositions[9])
        config.roulettePositions[9]:sendMagicEffect(math.random(CONST_ME_GIFT_WRAPS, CONST_ME_FIREWORK_BLUE))
    end

    -- Zmniejszenie opóźnienia dla animacji
    addEvent(spinAnimation, delay, playerId, leverPosition, remainingTime - delay, delay * config.animation.slowdownRate)
end

local function roulette(playerId, leverPosition)
    local player = Player(playerId)
    if not player then return end

    -- Uruchomienie animacji z opóźnieniem
    spinAnimation(playerId, leverPosition, config.animation.spinTime * 1000, 100)

    -- Sprawdzenie warunku wygranej po zakończeniu animacji
    addEvent(function()
        local prizeItemId = checkWinCondition()
        if prizeItemId then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You Won!")
            -- Dodanie nagrody dla gracza
            local rewardItem = nil
            for _, prize in ipairs(config.prizePool) do
                if prize.itemId == prizeItemId then
                    rewardItem = prize
                    break
                end
            end
            if rewardItem then
                player:addItem(rewardItem.itemId, math.random(rewardItem.count[1], rewardItem.count[2]))
            end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorry, You Lost!")
        end
        resetLever(leverPosition)
    end, config.animation.spinTime * 1000)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to play.")
        return true
    end

    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Casino Slot being used...")
        return true
    end

    player:removeItem(config.playItem.itemId, config.playItem.count)
    item:transform(config.lever.right)

    roulette(player:getId(), toPosition)

    return true
end

casinoRoulette:aid(config.actionId)
casinoRoulette:register()
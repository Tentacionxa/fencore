local config = {

    actionId = 18434,

    lever = {
        left = 8911,
        right = 8912
    },

    playItem = {
        itemId = 3043,
        count = 50
    },

    winCondition = {
        matchingItemsCount = 3, -- liczba elementów wymaganych do wygranej
    },

    prizePool = {
        {itemId = 23679, count = {1, 1}, chance = 3},
        {itemId = 14758, count = {1, 1}, chance = 1},
        {itemId = 3997, count = {1, 1}, chance = 4},
        {itemId = 943, count = {1, 1}, chance = 2},
        {itemId = 37317, count = {1, 1}, chance = 1},
        {itemId = 8149, count = {1, 1}, chance = 1},
    },

    roulettePositions = {
        Position(33453, 32490, 14), -- 1
        Position(33453, 32491, 14), -- 2
        Position(33453, 32492, 14), -- 3
        Position(33454, 32490, 14), -- 4
        Position(33454, 32491, 14), -- 5
        Position(33454, 32492, 14), -- 6
        Position(33455, 32490, 14), -- 7
        Position(33455, 32491, 14), -- 8
        Position(33455, 32492, 14), -- 9
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
         -- poziomo górny rząd
        {2, 5, 8}, -- poziomo środkowy rząd
        -- poziomo dolny rząd
         -- pionowo lewa kolumna
         -- pionowo środkowa kolumna
         -- pionowo prawa kolumna
        -- przekątna z lewej do prawej
          -- przekątna z prawej do lewej
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

    -- Zapisz ostatni przedmiot z pozycji 9
    local lastItem = Tile(config.roulettePositions[#config.roulettePositions]):getTopVisibleThing()

    -- Przesuń przedmioty z każdej pozycji na następną
    for i = #config.roulettePositions, 2, -1 do
        local fromPosition = config.roulettePositions[i - 1]
        local toPosition = config.roulettePositions[i]

        local item = Tile(fromPosition):getTopVisibleThing()
        if item then
            item:moveTo(toPosition)
             -- dodanie losowego efektu magicznego
        end
    end

    -- Przesuń ostatni przedmiot z pozycji 9 na pozycję 1, aby kontynuować pętlę
    if lastItem then
        lastItem:moveTo(config.roulettePositions[1])
         -- efekt magiczny dla nowego symbolu
    end

    -- Stwórz nowy przedmiot w pozycji 1 (opcjonalnie, jeśli chcesz losowe przedmioty)
    local newItemInfo = chanceNewReward()
    Game.createItem(newItemInfo.itemId, newItemInfo.count, config.roulettePositions[1])

    -- Kontynuuj obracanie z nowym opóźnieniem
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
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Casino slot being used...")
        return true
    end

    player:removeItem(config.playItem.itemId, config.playItem.count)
    item:transform(config.lever.right)

    roulette(player:getId(), toPosition)

    return true
end

casinoRoulette:aid(config.actionId)
casinoRoulette:register()

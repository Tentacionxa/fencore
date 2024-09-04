if not Karin then Karin = {} end

function Karin.firstLetterUpper(self, str)
    local words = str:split(" ")
    for i, word in ipairs(words) do
        words[i] = word:gsub("^%l", string.upper)
    end
    return table.concat(words, " ")
end

Karin.Forge = {
    Config = {
        tokenId = 943,  -- tutaj daj id tokena
        Default = 60, -- tutaj ustawiasz szanse na tier
        Tier = {
            [1] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
            },
            [2] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
            },
            [3] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
            },
            [4] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
            },
            [5] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
            },
            [6] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
            },
            [7] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
            },
            [8] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
            },
            [9] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
                
            },
            [10] = {
                [1] = 25000,
                [2] = 50000,
                [3] = 400000,
                [4] = 4000000,
                [5] = 5000000,
                [6] = 6000000,
                [7] = 7000000,
                [8] = 8000000,
                [9] = 9000000,
                [10] = 10000000,
                [11] = 15000000,
                [12] = 20000000,
                [13] = 25000000,
                [14] = 30000000,
                [15] = 35000000,
                [16] = 40000000,
                [17] = 45000000,
                [18] = 50000000,
                [19] = 55000000,
                [20] = 60000000,
            },
        },
    }
}


__SystemFunctions = {
    getTierCostByClassificationAndTier = function (self, classification, tier)
        local configTier = self.Config.Tier[tier + 1]

        if not configTier then
            return
        end

        return configTier[classification]
    end,
    forge = function (self, player, target, token)
        local cost = self:getTierCostByClassificationAndTier(target:getClassification(), target:getTier())
        if not cost then
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, 'You can\'t forge this item.')
            return
        end

        if player:removeMoneyBank(cost) then
            self:acceptForge(player, target, token)
        else
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, 'You need to have at least ' .. cost .. ' gps to forge.')
            return
        end
    end,
    acceptForge = function (self, player, itemChoosed, token)
        local successRate = self.Config.Default
        local success = math.random(0, 100) <= successRate
        local storeInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
        local forgeChest = Game.createItem(37561, 1)
        if success then
            itemChoosed:setTier(itemChoosed:getTier() + 1)
            itemChoosed:moveTo(forgeChest)
            forgeChest:moveTo(storeInbox)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your forge was successful. Your item was upgraded.')
            player:getPosition():sendMagicEffect(182)
        elseif itemChoosed:getTier() >= 1 then
            itemChoosed:setTier(itemChoosed:getTier() - 1)
            itemChoosed:moveTo(forgeChest)
            forgeChest:moveTo(storeInbox)
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, 'Your forge failed and your item was downgraded.')
            player:getPosition():sendMagicEffect(10)
        else
            itemChoosed:remove(1)
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, 'Your forge failed.')
            player:getPosition():sendMagicEffect(3)
        end

 token:remove(1)
        
    end,
}

Karin.Forge = setmetatable(
    Karin.Forge,
    { __index = __SystemFunctions }
)

local TokenForge = Action()

function TokenForge.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not target:isItem() then
        return false
    end
    Karin.Forge:forge(player, target, item)
	return true
end

TokenForge:id(Karin.Forge.Config.tokenId)
TokenForge:register()

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
        tokenId = 31327,  -- tutaj daj id tokena
        Default = 50, -- tutaj ustawiasz szanse na tier
        Tier = {
            [1] = {
                [1] = 25000,
                [2] = 750000,
                [3] = 4000000,
                [4] = 8000000,
            },
            [2] = {
                [2] = 5000000,
                [3] = 10000000,
                [4] = 20000000,
            },
            [3] = {
                [3] = 20000000,
                [4] = 40000000,
            },
            [4] = {
                [4] = 65000000,
            },
            [5] = {
                [4] = 100000000,
            },
            [6] = {
                [4] = 250000000,
            },
            [7] = {
                [4] = 750000000,
            },
            [8] = {
                [4] = 2500000000,
            },
            [9] = {
                [4] = 8000000000,
            },
            [10] = {
                [4] = 15000000000,
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
        local forgeChest = Game.createItem(37561, 1)
        if success then
            itemChoosed:setTier(itemChoosed:getTier() + 1)
            itemChoosed:moveTo(forgeChest)
            player:addItemEx(forgeChest)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your forge was successful. Your item was upgraded.')
            player:getPosition():sendMagicEffect(182)
        elseif itemChoosed:getTier() >= 1 then
            itemChoosed:setTier(itemChoosed:getTier() - 1)
            itemChoosed:moveTo(forgeChest)
            player:addItemEx(forgeChest)
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, 'Your forge failed and your item was downgraded.')
            player:getPosition():sendMagicEffect(10)
        else
            itemChoosed:moveTo(forgeChest)
            player:addItemEx(forgeChest)
            player:sendTextMessage(MESSAGE_GAME_HIGHLIGHT, 'Your forge failed.')
            player:getPosition():sendMagicEffect(3)
        end

        
        
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
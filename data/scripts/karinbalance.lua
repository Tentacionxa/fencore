-- ALTER TABLE players ADD COLUMN bloodybalance BIGINT(20) UNSIGNED NOT NULL DEFAULT '0'; 

-- To use in NPC file -> creatureSayCallback after the IF clause "checkInteraction"

-- if Karin.BloodyBalance:npcHandler(player, message, npc, npcHandler) then
--     return true
-- end

Karin.BloodyBalance = {
    Coins = {
        ['Bloody Coins'] = { id = 46315, value = 1}, -- 'bloody coins',
        ['Blood Coins'] = { id = 46316, value = 100}, -- 'blood coins',
    }
}

__SystemFunctions = {
   getPhysicalBalance = function(self, player)
        local balance = 0
        for _, data in pairs(self.Coins) do
            balance = balance + (player:getItemCount(data.id) * data.value)
        end
        return balance
   end,
   depositAll = function(self, player)
        local current = self:getPhysicalBalance(player)

        if current == 0 then
            return 0
        end
        
        local bloodCoins = player:getItemCount(self.Coins['Blood Coins'].id)
        local bloodyCoins = player:getItemCount(self.Coins['Bloody Coins'].id)

        player:removeItem(self.Coins['Blood Coins'].id, bloodCoins)
        player:removeItem(self.Coins['Bloody Coins'].id, bloodyCoins)

        local total = (bloodCoins * self.Coins['Blood Coins'].value) + bloodyCoins
        player:setBloodyBankBalance(total + player:getBloodyBankBalance())
        return total
   end,
   transferBloodyCoins = function(self, player, targetName, amount)
        local balance = player:getBloodyBankBalance()
        if balance < amount then
            return
        end

        if not player then
            return 
        end

        local target = Player(targetName)
        local offline
        if not target then
            target = Game.getOfflinePlayer(targetName)
            if not target then
                return 
            end
            offline = true
        end

        player:setBloodyBankBalance(balance - amount)
        target:setBloodyBankBalance(target:getBloodyBankBalance() + amount)

        if offline then
            target:save()
        end
        return true
   end,
   npcHandler = function (self, player, message, npc, npcHandler)
        if message == "deposit all" then
            local total = self:depositAll(player)
            npcHandler:say('You have deposited ' .. total .. ' bloody coins.', npc, player)
            npcHandler:setTopic(player:getId(), 0)
            return true
        elseif message == "balance" then
            local balance = player:getBloodyBankBalance()
            npcHandler:say('You have ' .. balance .. ' bloody coins.', npc, player)
            npcHandler:setTopic(player:getId(), 0)
            return true
        elseif npcHandler:getTopic(player:getId()) <= 0 and MsgContains(message, 'transfer') then -- transfer bloody coins
            npcHandler:say('Please tell me the amount of bloody coins you would like to transfer.', npc, player)
            npcHandler:setTopic(player:getId(), 3)
            return true
        elseif npcHandler:getTopic(player:getId()) == 3 then -- transfer bloody coins
            local amount = tonumber(message)
            if not amount or amount <= 0 then
                npcHandler:say('Please, tell me a number.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            local balance = player:getBloodyBankBalance()
            if balance < amount then
                npcHandler:say('You do not have enough bloody coins.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            npcHandler:say('Who would you like transfer ' .. amount .. ' bloody coins to?', npc, player)
            player:kv():set('bctransfer', amount)
            npcHandler:setTopic(player:getId(), 33)
            return true
        elseif npcHandler:getTopic(player:getId()) == 33 then -- transfer bloody coins
            local target = Player(message)
            if not target then
                target = Game.getOfflinePlayer(message)
                if not target then
                    npcHandler:say('This player does not exist.', npc, player)
                    npcHandler:setTopic(player:getId(), 0)
                    return true
                end
            end

            player:kv():set('bctransfertarget', target:getName())
            npcHandler:say('Are you sure you want to transfer ' .. player:kv():get('bctransfer') .. ' bloody coins to ' .. target:getName() .. '?', npc, player)
            npcHandler:setTopic(player:getId(), 333)
            return true
        elseif npcHandler:getTopic(player:getId()) == 333 and MsgContains(message, 'yes') then -- transfer bloody coins
            local amount = player:kv():get('bctransfer')
            local targetName = player:kv():get('bctransfertarget')
            if not amount or amount <= 0 then
                npcHandler:say('Please, tell me a number.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            local balance = player:getBloodyBankBalance()
            if balance < amount then
                npcHandler:say('You do not have enough bloody coins.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            if self:transferBloodyCoins(player, targetName, amount) then
                npcHandler:say('You have transferred ' .. amount .. ' bloody coins to ' .. targetName .. '.', npc, player)
            else
                npcHandler:say('You do not have enough bloody coins.', npc, player)
            end

            npcHandler:setTopic(player:getId(), 0)
            return true
        elseif npcHandler:getTopic(player:getId()) <= 0 and MsgContains(message, 'exchange') then -- exchange bloody coins
            npcHandler:say('How many bloody coins do you want to exchange? Min: 50 Bloody coins = 1kk.', npc, player)
            npcHandler:setTopic(player:getId(), 2)
            return true
        elseif npcHandler:getTopic(player:getId()) == 2 then -- exchange bloody coins
            local amount = tonumber(message)
            if not amount or amount < 50 then
                npcHandler:say('Please, tell me a number starting from 50 bloody coins.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            local bloodyToReceive = math.floor(amount / 50)
            local goldCoins = bloodyToReceive * 1000000
            bloodyToReceive = bloodyToReceive * 50

  
            if player:getMoney() + player:getBankBalance() < goldCoins then
                npcHandler:say('You do not have enough gold coins.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            npcHandler:say('Are you sure you want to exchange ' .. goldCoins .. ' gold coins to ' .. bloodyToReceive .. ' bloody coins?', npc, player)
            npcHandler:setTopic(player:getId(), 22)
            player:kv():set('bcexchangetoreceive', bloodyToReceive)
            player:kv():set('bcexchangegold', goldCoins)
            return true
        elseif npcHandler:getTopic(player:getId()) == 22 and MsgContains(message, 'yes') then -- exchange bloody coins
            local goldCoins = player:kv():get('bcexchangegold')
            local bloodyToReceive = player:kv():get('bcexchangetoreceive')
        
            if player:getMoney() + player:getBankBalance() >= goldCoins then
                if player:removeMoneyBank(goldCoins) then
                    player:setBloodyBankBalance(player:getBloodyBankBalance() + bloodyToReceive)
                    npcHandler:say('You have exchanged ' .. goldCoins .. ' gold coins to ' .. bloodyToReceive .. ' bloody coins.', npc, player)
                else
                    npcHandler:say('You do not have enough gold coins.', npc, player)
                end
            else
                npcHandler:say('You do not have enough gold coins.', npc, player)
            end
            npcHandler:setTopic(player:getId(), 0)
            return true
        elseif npcHandler:getTopic(player:getId()) <= 0 and MsgContains(message, "withdraw") then -- withdraw bloody coins
            npcHandler:say('How many bloody coins do you want to withdraw?', npc, player)
            npcHandler:setTopic(player:getId(), 1)
            return true
        elseif npcHandler:getTopic(player:getId()) == 1 then -- withdraw bloody coins
            local amount = tonumber(message)
            if not amount or amount <= 0 then
                npcHandler:say('Please, tell me a number.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            local balance = player:getBloodyBankBalance()
            if balance < amount then
                npcHandler:say('You do not have enough bloody coins.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            npcHandler:say('Are you sure you want to withdraw ' .. amount .. ' bloody coins?', npc, player)
            player:kv():set('bcwithdraw', amount)
            npcHandler:setTopic(player:getId(), 11)
            return true
        elseif npcHandler:getTopic(player:getId()) == 11 and MsgContains(message, 'yes') then -- withdraw bloody coins
            local amount = player:kv():get('bcwithdraw')

            if not amount or amount <= 0 then
                npcHandler:say('Please, tell me a number.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end
            
            local balance = player:getBloodyBankBalance()
            if balance < amount then
                npcHandler:say('You do not have enough bloody coins.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            player:setBloodyBankBalance(balance - amount)

            local totalBloodCoins = math.floor(amount / self.Coins['Blood Coins'].value)
            local totalBloodyCoins = amount % self.Coins['Blood Coins'].value

            player:addItem(self.Coins['Blood Coins'].id, totalBloodCoins)
            player:addItem(self.Coins['Bloody Coins'].id, totalBloodyCoins)

            npcHandler:say('You have withdrawn ' .. amount .. ' bloody coins.', npc, player)
            npcHandler:setTopic(player:getId(), 0)
            return true
        end
   end
}

Karin.BloodyBalance = setmetatable(
    Karin.BloodyBalance, 
    { __index = __SystemFunctions }
)

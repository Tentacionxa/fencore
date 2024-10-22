Karin.BloodyBalance = {
    Coins = {
        ['Ancient Blood Coins'] = { id = 46315, value = 1 },    -- Pink: 1x 'Ancient Blood Coin' = 1x 'balance deduction'
        ['Blood Coins'] = { id = 46316, value = 10 },           -- Red: 1x 'Blood Coin' = 10x 'balance deduction'
        ['Bloody Coins'] = { id = 46314, value = 100 }          -- Green: 1x 'Bloody Coin' = 100x 'balance deduction'
    }
}

__SystemFunctions = {
    -- Function to get the total balance of all physical coins in player's inventory
    getPhysicalBalance = function(self, player)
        local balance = 0
        for _, data in pairs(self.Coins) do
            balance = balance + (player:getItemCount(data.id) * data.value)
        end
        return balance
    end,

    -- Function to deposit all physical coins into the player's bank
    depositAll = function(self, player)
        local currentBalance = self:getPhysicalBalance(player)

        if currentBalance == 0 then
            return 0
        end

        -- Retrieve the number of each coin type in the player's inventory
        local ancientBloodCoins = player:getItemCount(self.Coins['Ancient Blood Coins'].id)
        local bloodCoins = player:getItemCount(self.Coins['Blood Coins'].id)
        local bloodyCoins = player:getItemCount(self.Coins['Bloody Coins'].id)

        -- Remove the coins from the player's inventory
        player:removeItem(self.Coins['Ancient Blood Coins'].id, ancientBloodCoins)
        player:removeItem(self.Coins['Blood Coins'].id, bloodCoins)
        player:removeItem(self.Coins['Bloody Coins'].id, bloodyCoins)

        -- Calculate the total value to deposit
        local total = (ancientBloodCoins * self.Coins['Ancient Blood Coins'].value) +
                      (bloodCoins * self.Coins['Blood Coins'].value) +
                      (bloodyCoins * self.Coins['Bloody Coins'].value)

        -- Deposit the total value into the player's bank balance
        player:setBloodyBankBalance(total + player:getBloodyBankBalance())
        return total
    end,

    -- Function to transfer bloody coins from one player to another
    transferBloodyCoins = function(self, player, targetName, amount)
        local balance = player:getBloodyBankBalance()
        if balance < amount then
            return false, "You do not have enough balance to transfer."
        end

        if not player then
            return false, "Invalid player."
        end

        local target = Player(targetName)
        local offline = false
        if not target then
            target = Game.getOfflinePlayer(targetName)
            if not target then
                return false, "Target player does not exist."
            end
            offline = true
        end

        -- Transfer coins between players
        player:setBloodyBankBalance(balance - amount)
        target:setBloodyBankBalance(target:getBloodyBankBalance() + amount)

        -- Save target if offline
        if offline then
            target:save()
        end

        return true, "You have transferred " .. amount .. " bloody coins to " .. targetName .. "."
    end,

    -- Function to withdraw a specific amount of coins for the chosen currency
    withdrawCoins = function(self, player, requestedAmount, currencyType)
        local balance = player:getBloodyBankBalance()
        local coinValue = self.Coins[currencyType].value

        -- Calculate how much of the chosen currency the player can withdraw
        local requiredBalance = requestedAmount * coinValue

        -- Check if the player has enough balance in the bank to withdraw this amount
        if balance < requiredBalance then
            return false, "You do not have enough balance to withdraw " .. requestedAmount .. " " .. currencyType .. "."
        end

        -- Deduct the correct amount from the player's bank balance
        player:setBloodyBankBalance(balance - requiredBalance)

        -- Add the correct coins to the player's inventory
        player:addItem(self.Coins[currencyType].id, requestedAmount)

        return true, "You have withdrawn " .. requestedAmount .. " " .. currencyType .. "."
    end,

    -- NPC handler to process deposits, withdrawals, transfers, etc.
    npcHandler = function(self, player, message, npc, npcHandler)
        if message == "deposit all" then
            local total = self:depositAll(player)
            if total > 0 then
                npcHandler:say('You have deposited ' .. total .. ' bloody coins.', npc, player)
            else
                npcHandler:say('You do not have any coins to deposit.', npc, player)
            end
            npcHandler:setTopic(player:getId(), 0)
            return true
        elseif message == "balance" then
            local balance = player:getBloodyBankBalance()
            npcHandler:say('You have ' .. balance .. ' bloody coins in your bank account.', npc, player)
            npcHandler:setTopic(player:getId(), 0)
            return true
        elseif npcHandler:getTopic(player:getId()) <= 0 and MsgContains(message, "withdraw") then -- withdraw bloody coins
            npcHandler:say('Which currency would you like to withdraw? Green (Bloody Coins), Red (Blood Coins), or Pink (Ancient Blood Coins)?', npc, player)
            npcHandler:setTopic(player:getId(), 101)
            return true
        elseif npcHandler:getTopic(player:getId()) == 101 then
            local currency
            if message == "green" then
                currency = "Bloody Coins"            -- Withdraws Bloody Coins (ID 46314) = 100 deducted per coin
            elseif message == "red" then
                currency = "Blood Coins"             -- Withdraws Blood Coins (ID 46316) = 10 deducted per coin
            elseif message == "pink" then
                currency = "Ancient Blood Coins"     -- Withdraws Ancient Blood Coins (ID 46315) = 1 deducted per coin
            else
                npcHandler:say("Please choose a valid option: Green, Red, or Pink.", npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end
            player:kv():set('chosenCurrency', currency)
            npcHandler:say('How many coins do you want to withdraw?', npc, player)
            npcHandler:setTopic(player:getId(), 102)
            return true
        elseif npcHandler:getTopic(player:getId()) == 102 then
            local amount = tonumber(message)
            if not amount or amount <= 0 then
                npcHandler:say('Please enter a valid number.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            local chosenCurrency = player:kv():get('chosenCurrency')
            local success, response = self:withdrawCoins(player, amount, chosenCurrency)
            npcHandler:say(response, npc, player)
            npcHandler:setTopic(player:getId(), 0)
            return true
        elseif npcHandler:getTopic(player:getId()) <= 0 and MsgContains(message, "transfer") then -- transfer bloody coins
            npcHandler:say('Please tell me the amount of bloody coins you would like to transfer.', npc, player)
            npcHandler:setTopic(player:getId(), 3)
            return true
        elseif npcHandler:getTopic(player:getId()) == 3 then -- transfer bloody coins
            local amount = tonumber(message)
            if not amount or amount <= 0 then
                npcHandler:say('Please, tell me a valid number.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            local balance = player:getBloodyBankBalance()
            if balance < amount then
                npcHandler:say('You do not have enough bloody coins.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            npcHandler:say('Who would you like to transfer ' .. amount .. ' bloody coins to?', npc, player)
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
                npcHandler:say('Please, tell me a valid number.', npc, player)
                npcHandler:setTopic(player:getId(), 0)
                return true
            end

            local success, response = self:transferBloodyCoins(player, targetName, amount)
            npcHandler:say(response, npc, player)
            npcHandler:setTopic(player:getId(), 0)
            return true
        end
    end
}

Karin.BloodyBalance = setmetatable(
    Karin.BloodyBalance, 
    { __index = __SystemFunctions }
)

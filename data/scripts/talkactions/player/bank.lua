local config = {
	enabled = true,
	messageStyle = MESSAGE_LOOK,
}

if not config.enabled then
	return
end

local exhaustGroup = "talkactions"
local exhaustTime = 2 -- 2 seconds exhaust (2000 ms)

-- !balance Command
local balance = TalkAction("!balance")

function balance.onSay(player, words, param)
    -- Check if the player is exhausted for this command
    if player:getExhaustion(exhaustGroup) > 0 then
        player:sendCancelMessage("You are exhausted. Please wait before using this command again.")
        return false
    end

	player:sendTextMessage(config.messageStyle, "Your current bank balance is " .. FormatNumber(Bank.balance(player)) .. ".")

    -- Set the exhaust for 2 seconds
    player:setExhaustion(exhaustGroup, exhaustTime)
	return true
end

balance:separator(" ")
balance:groupType("normal")
balance:register()

-- !deposit Command
local deposit = TalkAction("!deposit")

function deposit.onSay(player, words, param)
    -- Check if the player is exhausted for this command
    if player:getExhaustion(exhaustGroup) > 0 then
        player:sendCancelMessage("You are exhausted. Please wait before using this command again.")
        return false
    end

	local amount
	if param == "all" then
		amount = player:getMoney()
	else
		amount = tonumber(param)
		if not amount or amount <= 0 and isValidMoney(amount) then
			player:sendTextMessage(config.messageStyle, "Invalid amount.")
			return true
		end
	end

	if not Bank.deposit(player, amount) then
		player:sendTextMessage(config.messageStyle, "You don't have enough money.")
		return true
	end

	player:sendTextMessage(config.messageStyle, "You have deposited " .. FormatNumber(amount) .. " gold coins.")

    -- Set the exhaust for 2 seconds
    player:setExhaustion(exhaustGroup, exhaustTime)
	return true
end

deposit:separator(" ")
deposit:groupType("normal")
deposit:register()

-- !withdraw Command
local withdraw = TalkAction("!withdraw")

function withdraw.onSay(player, words, param)
    -- Check if the player is exhausted for this command
    if player:getExhaustion(exhaustGroup) > 0 then
        player:sendCancelMessage("You are exhausted. Please wait before using this command again.")
        return false
    end

	local amount = tonumber(param)
	if not amount or amount <= 0 and isValidMoney(amount) then
		player:sendTextMessage(config.messageStyle, "Invalid amount.")
		return true
	end

	if not Bank.withdraw(player, amount) then
		player:sendTextMessage(config.messageStyle, "You don't have enough money.")
		return true
	end

	player:sendTextMessage(config.messageStyle, "You have withdrawn " .. FormatNumber(amount) .. " gold coins.")

    -- Set the exhaust for 2 seconds
    player:setExhaustion(exhaustGroup, exhaustTime)
	return true
end

withdraw:separator(" ")
withdraw:groupType("normal")
withdraw:register()

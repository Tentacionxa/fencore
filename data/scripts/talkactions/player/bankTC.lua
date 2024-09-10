local config = {
	enabled = true,
	messageStyle = MESSAGE_LOOK,
}
local storeCoin = Action()

function storeCoin.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local count = item:getCount(ITEM_STORE_COIN)
	player:addTransferableCoins(count)
	player:removeTransferableCoinsBalance(amount)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have added " .. count .. " tibia coins to your balance. Your total is now " .. player:getTransferableCoins() .. ".")
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	item:remove()

	logger.warn("[StoreCoinScript - ITEM_STORE_COIN] The player {} used the item to store Tibia Coins.", player:getName())
	return true
end

storeCoin:id(ITEM_STORE_COIN)
storeCoin:register()

if not config.enabled then
	return
end

local balance = TalkAction("!tcbalance")

function balance.onSay(player, words, param)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your current Tibia Coins balance is " .. ((player):getTransferableCoins()) .. " tibia coins.")
	return true
end

balance:separator(" ")
balance:groupType("normal")
balance:register()

local deposit = TalkAction("!tcdeposit")
local count = item:getCount(ITEM_STORE_COIN)

function tcdeposit.onSay(player, words, param)
	local amount
	if param == "all" then
		amount = player:addTransferableCoins(count)
	else
		amount = tonumber(param)
		if not amount or amount <= 0 and isValidMoney(amount) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Invalid amount.")
			return true
		end
	end

	if not Bank.deposit(player, amount) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough money.")
		return true
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have deposited " .. (amount) .. " Tibia Coins.")
	return true
end

deposit:separator(" ")
deposit:groupType("normal")
deposit:register()

local withdraw = TalkAction("!withdraw")

function withdraw.onSay(player, words, param)
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
	return true
end

withdraw:separator(" ")
withdraw:groupType("normal")
withdraw:register()

local transfer = TalkAction("!transfer")

function transfer.onSay(player, words, param)
	local split = param:split(",")
	local amount = tonumber(split[2])
	if not amount or amount <= 0 and isValidMoney(amount) then
		player:sendTextMessage(config.messageStyle, "Invalid amount.")
		return true
	end

	local name = split[1]
	if not name then
		player:sendTextMessage(config.messageStyle, "Invalid name.")
		return true
	end
	name = name:trim()
	local normalizedName = Game.getNormalizedPlayerName(name)
	if not normalizedName then
		player:sendTextMessage(config.messageStyle, "A player with name " .. name .. " does not exist.")
		return true
	end
	name = normalizedName

	if not player:transferMoneyTo(name, amount) then
		player:sendTextMessage(config.messageStyle, "You don't have enough money.")
		return true
	end

	player:sendTextMessage(config.messageStyle, "You have transferred " .. FormatNumber(amount) .. " gold coins to " .. name .. ".")
	return true
end

transfer:separator(" ")
transfer:groupType("normal")
transfer:register()

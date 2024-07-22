local bless = TalkAction("!bless")

function bless.onSay(player, words, param)
	if player:isVip() then
	Blessings.BuyAllBlesses(player)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
else
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be a VIP member to use this command.")
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end

bless:groupType("normal")
bless:register()

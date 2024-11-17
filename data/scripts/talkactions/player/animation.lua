-- Usage talkaction: "!animation on" or "!animation off"
local animationSpell = TalkAction("!animation")

function animationSpell.onSay(player, words, param)
	if param == "" then
		player:sendCancelMessage("You need to specify on/off param.")
		return true
	end
	if param == "on" then
		player:setStorageValue(50008, 1)
		player:sendTextMessage(MESSAGE_LOOK, "You desactivated spells animation")
	elseif param == "off" then
		player:setStorageValue(50008, 0)
		player:sendTextMessage(MESSAGE_LOOK, "You activated spells animation")
	end
	return true
end

animationSpell:separator(" ")
animationSpell:groupType("normal")
animationSpell:register()

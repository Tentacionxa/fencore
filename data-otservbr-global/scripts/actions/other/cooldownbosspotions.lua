bosspotion = 19731

local bosspotion = Action()

function bosspotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	Player:setBossCooldown("Faceless Bane", 0)
    Player:setBossCooldown("Tentugly's Head", 0)


	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You removed cooldown on all bosses")
	return true
end

bosspotion:id(bosspotion)
bosspotion:register()

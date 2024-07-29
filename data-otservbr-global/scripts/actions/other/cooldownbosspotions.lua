local bosspotion = Action()
function bosspotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
		Player:setBossCooldown("Faceless Bane", 0)
    Player:setBossCooldown("Tentugly's Head", 0)
		player:sendTextMessage(19, "You can fight the bosses again!")

	return true
end

bosspotion:id(19731)
bosspotion:register()
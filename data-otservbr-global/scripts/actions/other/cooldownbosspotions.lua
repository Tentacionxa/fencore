local bosspotion = Action()
function bosspotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:canFightBoss("Faceless Bane") then
		Player:setBossCooldown("Faceless Bane", 0)
    Player:setBossCooldown("Tentugly's Head", 0)
		player:sendTextMessage(19, "You can fight the bosses again!")
	else
		player:sendTextMessage(19, "You access to the bosses has already been released!")
	end

	return true
end

bosspotion:id(19371)
bosspotion:register()
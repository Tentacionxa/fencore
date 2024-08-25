local snowball = Action()
function snowball.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(10109) > 0 and player:getStorageValue(10108) <= 30  then

		player:setStorageValue(10108, player:getStorageValue(10108) + SnowBall_Configurations.Ammo_Configurations.Ammo_Ammount)
		player:setStorageValue(10109, player:getStorageValue(10109) - SnowBall_Configurations.Ammo_Configurations.Ammo_Price)
		player:sendTextMessage(29, "You just bought".. SnowBall_Configurations.Ammo_Configurations.Ammo_Ammount .." snow balls for ".. SnowBall_Configurations.Ammo_Configurations.Ammo_Price .."\nYou have ".. player:getStorageValue(10108) .." bolas de neve\nYou have ".. player:getStorageValue(10109) .." point(s).")
	elseif player:getStorageValue(10109) < 1 then

		player:sendCancelMessage("You do not have ".. SnowBall_Configurations.Ammo_Configurations.Ammo_Price .." point(s).")
	elseif player:getStorageValue(10108) > 30 then

		player:sendCancelMessage("You can only buy snowballs with a minimum of 30 balls.")
	end
    return true
end

snowball:aid(7900)
snowball:register()

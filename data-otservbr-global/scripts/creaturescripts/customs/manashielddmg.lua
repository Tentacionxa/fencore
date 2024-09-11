local manaDamage = CreatureEvent("IncreaseManaDamageEvent")

function manaDamage.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if not attacker then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end
	
	if primaryType == COMBAT_HEALING or secondaryType == COMBAT_HEALING then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end
	
	local amount = 2.2 --Increase Dmg 200% [[1.1 = +10% dmg, 1.5 = +50% dmg]]
	
	if amount > 0 then
		return primaryDamage * amount, primaryType, amount * secondaryDamage, secondaryType
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

manaDamage:register()
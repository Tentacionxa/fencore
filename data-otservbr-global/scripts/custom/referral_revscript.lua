local config = {
	requiredLevel = 1000, -- Required level that the referred player must reach
	bonus = {
		premiumPoints = 0,		-- The number of premium points (in myaac) that the referrer will get, zero to disable
		coins = 0,				-- The number of coins (in myaac) that the referrer will get, zero to disable
		transferableCoins = 200	-- The number of transferableCoins (in myaac) that the referrer will get, zero to disable
	}
}

local playerLoginReferral = CreatureEvent("playerLoginReferral")

function playerLoginReferral.onLogin(player)
	player:registerEvent("onAdvanceReferral")

	return true
end

playerLoginReferral:register()

local onAdvanceReferral = CreatureEvent("onAdvanceReferral")

function onAdvanceReferral.onAdvance(player, skill, oldLevel, newLevel)

	if skill == SKILL_LEVEL and newLevel >= config.requiredLevel then
		local accountId = player:getAccountId()
		-- Fetch the ref_key where account_id = accountId and blocked = 0
		local resultId = db.storeQuery("SELECT `ref_key` FROM `__cornex_referral_actions` WHERE `registered_by` = " .. accountId .. " AND `blocked` = 0")
		-- If result is found
		if resultId ~= false then

			-- Fetch the referrer's account_id based on ref_key from previous query result
			local resultId2 = db.storeQuery("SELECT `belongs_to` FROM `__cornex_referral` WHERE `referral_key` = '" .. result.getDataString(resultId, "ref_key") .. "'")
				-- If result is found
			if resultId2 ~= false then     
				-- Update accountId's row blocked value to 1
				db.query("UPDATE `__cornex_referral_actions` SET `blocked` = 1 WHERE `registered_by` = " .. accountId)

				-- Update points to referrer
				if (config.bonus.premiumPoints > 0) then
					db.query("UPDATE `accounts` SET `premium_points` = (premium_points + " .. config.bonus.premiumPoints .. ") WHERE `account_id` = '" .. result.getDataInt(resultId2, "belongs_to") .. "'")
				end
				if (config.bonus.coins > 0) then
					db.query("UPDATE `accounts` SET `coins` = (coins + " .. config.bonus.coins .. ") WHERE `account_id` = '" .. result.getDataInt(resultId2, "belongs_to") .. "'")
				end
				if (config.bonus.transferableCoins > 0) then
					db.query("UPDATE `accounts` SET `transferable_coins` = (transferable_coins + " .. config.bonus.transferableCoins .. ") WHERE `account_id` = '" .. result.getDataInt(resultId2, "belongs_to") .. "'")
				end
				
				result.free(resultId2)
			else
				print("Missing ref_key in `__cornex_referral` where ref_key = " .. result.getDataString(resultId, "ref_key"))
			end
			result.free(resultId)

		end
	end

	return true
end

onAdvanceReferral:register()
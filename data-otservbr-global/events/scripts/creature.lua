function Creature:onChangeOutfit(outfit)
		-- Battlefield event
		if self:getStorageValue(BATTLEFIELD.storage) > 0 then
			self:sendCancelMessage("You can't change my outfit inside the event.")
			return false
		end
	end

 function Creature:onTargetCombat(target)

	-- Battlefield event
	if self:isPlayer() and target:isPlayer() then
		if self:getStorageValue(BATTLEFIELD.storage) > 0 then
			if self:getStorageValue(BATTLEFIELD.storage) == target:getStorageValue(BATTLEFIELD.storage) then
				return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
			end
		end
	end

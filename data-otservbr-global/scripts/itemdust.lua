local dust = Action()

function dust.onUse(player, item, fromPosition, target, toPosition, isHotkey)
local amount = 100 -- quantidade de dusts que o item vai dar
local totalDusts = player:getForgeDusts()
local limitDusts = 200 -- quantidade maxima de dusts
  
	if (totalDusts + amount) < limitDusts then
		player:addForgeDusts(amount)
	  
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You gained "..amount.." dusts")
		item:remove(1)
		return true
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Not possible to get  200 DUSTS")
	end
end

dust:id() -- ID do item a ser transformado em dusts
dust:register()

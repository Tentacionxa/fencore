local config = {
	{ name="Infernal 4000+", position = Position(33482, 33059, 15) },
    { name="Roten 4000+", position = Position (33600, 33063, 15) },
	{ name="Roothing 1500+", position = Position(33762, 33069, 15) },
	{ name="Library 1000+", position = Position(33861, 33070, 15) }
	
}

local tepppvip = MoveEvent()
function tepppvip.onStepIn(creature, item, position, fromPosition, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

	local window = ModalWindow {
		title = "NO BOT Hunt Portal",
		message = "Locations"
	}
	for i, info in pairs(config) do
		window:addChoice(string.format("%s", info.name), function (player, button, choice)
			if button.name ~= "Select" then
				return true
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You were teleported to " .. info.name)
			player:teleportTo(info.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			return true
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return true
end
tepppvip:type("stepin")
tepppvip:uid(41535)
tepppvip:register()
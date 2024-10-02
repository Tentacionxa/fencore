local config = {
	{ name="Night Island", position = Position(31944, 32399, 5) },
    { name="Cemetery", position = Position (32130, 32201, 7) },
	{ name="Cyclops Mountain", position = Position(32189, 32231, 7) },
    { name="Elf Island Cave", position = Position (31869, 32254, 6) }
	
}

local tepppvip = MoveEvent()
function tepppvip.onStepIn(creature, item, position, fromPosition, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

	local window = ModalWindow {
		title = "Rookie Portal",
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
tepppvip:uid(42535)
tepppvip:register()


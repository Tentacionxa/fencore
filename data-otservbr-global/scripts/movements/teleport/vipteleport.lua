local config = {
	{ name="Asura Palace", position = Position(32951, 32690, 7) },
	{ name="Buried Cathedral", position = Position(33618, 32519, 14) },
	{ name="Soul War", position = Position(33621, 31424, 10) },
	{ name="Cobra Bastion", position = Position(33392, 32624, 7) },
	{ name="Secret Library", position = Position(32515, 32533, 12) },
	{ name="Zao Palace", position = Position(33215, 31056, 9) },
	{ name="Falcon Bastion", position = Position(33315, 31351, 7) },
	{ name="Roshamuul Prison", position = Position(33592, 32427, 8) },
	{ name="Marapur Nagas", position = Position(33656, 32762, 8) },
	{ name="Banuta", position = Position(32892, 32632, 11) },
	{ name="Summer Court", position = Position(33677, 32228, 7) },
	{ name="Winter Court", position = Position(33680, 32148, 7) },
	{ name="Spike -8", position = Position(32237, 32601, 15) },
	{ name="Warzone 3", position = Position(32994, 31911, 12) },
	{ name="Warzone 5", position = Position(33774, 32196, 14) },
	{ name="Marapur Turtles", position = Position(33750, 32776, 9) },
	{ name="Bashmu", position = Position(33969, 31648, 8) },
	{ name="Infernatil Seal", position = Position(33397, 32457, 13) },
	{ name="Diremaw Task Area", position = Position(33831, 32124, 14) },
	{ name="Deeper Ingol", position = Position(33798, 32560, 12) },
	{ name="Issavi Puzzle Chambers", position = Position(33809, 31652, 9) },
	{ name="Darklight Core Vemiath", position = Position(33998, 31823, 15) },
	{ name="Gloom Pillars Chagorz", position = Position(33896, 31875, 15)},
	{ name="Jaded Roots Murcion", position = Position(33897, 31690, 15)},
	{ name="Jaded Roots Ichgahal", position = Position(34063, 31715, 15)},
	{ name="INQ", position = Position(33165, 31709, 14) }
}

local teppvip = MoveEvent()
function teppvip.onStepIn(creature, item, position, fromPosition, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

	local window = ModalWindow {
		title = "Teleport Portal",
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
teppvip:type("stepin")
teppvip:uid(43535)
teppvip:register()

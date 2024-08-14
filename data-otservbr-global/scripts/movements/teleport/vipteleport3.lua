local config = {
	{ name="Vicious Underground", position = Position(32486, 33191, 10)  },
	{ name="Dragon Kingdom", position = Position(31079, 33080, 7)  },
    { name="Ancient Grimwale", position = Position(30426, 33295, 8)  },
	{ name="Gazer Anomaly", position = Position(31900, 33375, 7)  },
	{ name="Deathling Universe", position = Position(32033, 33738, 7)  },
	{ name="Stonerefiner Underground", position = Position(31417, 33472, 7)  },
	{ name="Asura Kingdom", position = Position(34507, 33227, 7) },
	{ name="Jungle Tunnels", position = Position(34626, 33046, 7) },
	{ name="Baloon Land", position = Position(31581, 32761, 8) }
	
}

local teppppvip = MoveEvent()
function teppppvip.onStepIn(creature, item, position, fromPosition, target, toPosition)
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
teppppvip:type("stepin")
teppppvip:uid(43537)
teppppvip:register()


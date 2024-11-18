local config = {
	{ name="Vicious Underground", position = Position(32486, 33191, 10)  },
	{ name="Dragon Kingdom", position = Position(31079, 33080, 7)  },
 { name="Bulltaur Underground", position = Position(32022, 31603, 12)  },
    { name="Ancient Grimwale", position = Position(30426, 33295, 8)  },
	{ name="Falcon Kingdom", position = Position(32479, 33455, 6)  },
	{ name="Underworld Library", position = Position(34953, 33033, 7)  },
	{ name="Gazer Anomaly", position = Position(31900, 33375, 7)  },
	{ name="Deathling Universe", position = Position(32033, 33738, 7)  },
	{ name="Deathling Crypt", position = Position(34152, 33021, 8)  },
	{ name="Stonerefiner Underground", position = Position(31417, 33472, 7)  },
	{ name="Asura Kingdom", position = Position(34507, 33227, 7) },
	{ name="Jungle Tunnels", position = Position(34626, 33046, 7) },
	{ name="Lamassu Isle Rock", position = Position(33477, 31446, 7)},
	{ name="Flimsy Hideout", position = Position(33734, 31161, 8)},
	{ name="Weretiger Cave", position = Position(33766, 30794, 8) },
	{ name="Melting Underground", position = Position(33846, 32679, 13) },
	{ name="Rootthing Swamp", position = Position(31546, 32192, 8) },
	{ name="Rootthing Swamp 2", position = Position(31681, 31958, 8) },
	{ name="Rootthing Swamp 3", position = Position(31704, 31729, 8) },
	{ name="Rootthing Cave", position = Position(34870, 33207, 7) },
	{ name="Rootthing Lair", position = Position(35103, 33108, 5) },
	{ name="Quara City", position = Position(31195, 31824, 6) },
	{ name="Soul War 2", position = Position(34279, 30979, 9) },
	{ name="Soul War 3", position = Position(34243, 31016, 11) },
	{ name="Soul War 4", position = Position(34229, 31751, 3) },
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


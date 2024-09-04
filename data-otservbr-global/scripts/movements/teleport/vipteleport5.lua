local config = {
	{ name="Black Sheep", position = Position(33049, 32375, 10)},
	{ name="Crystal Wolf", position = Position(33130, 32142, 7)},
    { name="Donkey", position = Position(32258, 32352, 7)},
	{ name="Midnight Panther", position = Position(32871, 32690, 7)},
	{ name="Dragonling", position = Position(33299, 31845, 14)},
	{ name="Draptor", position = Position(33206, 31256, 7)  },
	{ name="Dromedary", position = Position(33274, 32772, 7)  },
	{ name="Gnarlhound", position = Position(33198, 31480, 8)},
	{ name="Hibernal Moth", position = Position(33703, 32135, 6) },
	{ name="Ironblight", position = Position(33060, 31945, 12)},
	{ name="Kingly Deer", position = Position(32758, 31912, 7)},
	{ name="Lacewing Moth", position = Position(33704, 32189, 7) },
	{ name="Ladybug", position = Position(33527, 31333, 7) },
	{ name="Manta Ray", position = Position(33547, 31294, 13)},
	{ name="Mole", position = Position(33214, 32268, 15)},
	{ name="Noble Lion", position = Position(33087, 32271, 10)},
	{ name="Racing Bird", position = Position(32681, 32959, 7) },
	{ name="Rapid Boar", position = Position(32615, 32293, 7)},
	{ name="Scorpion King", position = Position(32949, 32747, 12)},
	{ name="Shockhead", position = Position(33642, 32543, 7)},
	{ name="Sparkion", position = Position(32120, 31400, 13)},
	{ name="Stone Rhino ", position = Position(32896, 32850, 15)},
	{ name="Tiger Slug", position = Position(32112, 32264, 10)},
	{ name="Tin Lizzard", position = Position(32926, 31248, 10)},
	{ name="Panda", position = Position(32611, 32911, 7)},
	{ name="Titanica", position = Position(32105, 32798, 12)},
	{ name="Ursagrodon", position = Position(32090, 31017, 7)}
	
}

local teppppp5vip = MoveEvent()
function teppppp5vip.onStepIn(creature, item, position, fromPosition, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

	local window = ModalWindow {
		title = "Mount Teleport Portal",
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
teppppp5vip:type("stepin")
teppppp5vip:uid(43540)
teppppp5vip:register()


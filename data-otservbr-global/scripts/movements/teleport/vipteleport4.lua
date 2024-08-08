local config = {
	{ name="Arthom the Hunter", position = Position(32880, 32787, 8) },
	{ name="Big Boss Trolliver", position = Position(33120, 31744, 8) },
    { name="Burster", position = Position(32461, 32417, 10) },
	{ name="Clubarc The Plunderer", position = Position(33274, 31454, 7)},
	{ name="Dreadful Disruptor", position = Position(32047, 31380, 11)},
	{ name="Fleabringer", position = Position(33086, 31383, 8) },
	{ name="Foreman Kneebiter", position = Position(32554, 31878, 15) },
	{ name="Groam", position = Position(32634, 32021, 10) },
    { name="Grorlam", position = Position (32383, 32063, 12) },
	{ name="Oodok Witchmaster", position = Position(32861, 32800, 8) },
	{ name="Rotworm Queen", position = Position(33244, 32311, 9)},
    { name="Yaga the Crone", position = Position(32709, 32005, 10)},
	{ name="Yakchal", position = Position(32214, 31000, 14) },
	{ name="Arachir The Ancient One", position = Position(32968, 32394, 12)},
	{ name="Captain Jones", position = Position(33325, 32185, 6) },
	{ name="Dharalion", position = Position(33044, 32175, 9) },
	{ name="Diblis the Fair", position = Position(32013, 32793, 10) },
    { name="General Murius", position = Position(32410, 32114, 15) },
	{ name="Grandfather Tridian", position = Position(32408, 32775, 11) },
	{ name="Gravelord Oshuran", position = Position(32968, 32393, 12) },
    { name="Hairman The Huge", position = Position(32847, 32507, 8) },
	{ name="High Templar Cobrass", position = Position(32951, 32840, 8) },
    { name="Sir Valorcrest", position = Position(33270, 31762, 10)},
	{ name="Smuggler Baron Silvertoe", position = Position(32541, 32640, 10) },
	{ name="The Big Bad One", position = Position(33165, 31673, 7)},
    { name="The Evil Eye", position = Position(32783, 31682, 14) },
	{ name="The Old Whooper", position = Position(33311, 31666, 11)},
    { name="Warlord Ruzad", position = Position(32968, 31722, 5)},
	{ name="White Pale", position = Position(33265, 31862, 11) },
	{ name="Zevelon Duskbringer", position = Position(32758, 31558, 11)}
	
}

local tepppppvip = MoveEvent()
function tepppppvip.onStepIn(creature, item, position, fromPosition, target, toPosition)
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
tepppppvip:type("stepin")
tepppppvip:uid(43538)
tepppppvip:register()


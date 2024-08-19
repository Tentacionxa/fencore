local config = {
	{ name="Arthom the Hunter", position = Position(32880, 32788, 8) },
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
	{ name="Zevelon Duskbringer", position = Position(32758, 31558, 11)},
	{ name="The Frog Prince", position = Position(32385, 32130, 7) },
	{ name="The Handmaiden", position = Position(32782, 32278, 15)},
    { name="The Plasmother", position = Position(32840, 32339, 15)},
	{ name="The Imperor", position = Position(32899, 32217, 15)},
	{ name="Mr. Punish", position = Position(32780, 32246, 15)},
	{ name="Massacre", position = Position(32867, 32273, 15)},
	{ name="The Welter", position = Position(33021, 32655, 5) },
	{ name="The Voice of Ruin", position = Position(33313, 31129, 9) },
    { name="Tyrn", position = Position(33048, 32380, 14)},
	{ name="Zushuka", position = Position(31940, 31388, 9) },
	{ name="Zarabustor", position = Position(32507, 31578, 15)},
    { name="Xenia", position = Position(32891, 31886, 8)},
	{ name="Robby the Reckless", position = Position(32201, 31807, 9) },
    { name="Barbaria", position = Position(32008, 31418, 7)},
	{ name="Battlemaster Zunzu", position = Position(33175, 31230, 7) },
	{ name="Countess Sorrow ", position = Position(32794, 32352, 15)},
    { name="Hirintror", position = Position(32372, 31062, 8) },
	{ name="Ocyakao", position = Position(32343, 31064, 7)},
    { name="Rukor Zad", position = Position(32602, 32378, 10)},
	{ name="Jesse the Wicked ", position = Position(32370, 32219, 11) },
	{ name="Man in the cave", position = Position(32135, 31146, 2)},
	{ name="Dracola", position = Position(32826, 32279, 15)},
	{ name="Willy Wasp", position = Position(32374, 31672, 7) },
	{ name="Zomba", position = Position(33153, 32444, 7)},
    { name="Omrafir", position = Position(33583, 32372, 12)},
	{ name="Chikhaton", position = Position(33322, 31738, 8)},
	{ name="Chizzoron the Distorter", position = Position(33344, 31605, 4)},
    { name="Phrodomo", position = Position(32154, 31827, 8)},
	{ name="Devovorga", position = Position(32913, 31514, 10)},
    { name="Dreadmaw", position = Position(33301, 31155, 7)},
	{ name="Raxias", position = Position(33439, 32161, 7) },
	{ name="Feroxa", position = Position(33414, 31536, 10)},
    { name="The Blightfather", position = Position(33315, 31145, 7) },
	{ name="Teneshpar", position = Position(32883, 31499, 10)},
    { name="The Abomination", position = Position(33154, 32815, 7)},
	{ name="The Mutated Pumpkin", position = Position(33210, 32380, 6)},
	{ name="Furyosa", position = Position(33308, 31825, 14)}
	
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


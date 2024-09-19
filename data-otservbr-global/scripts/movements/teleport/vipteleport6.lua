local config = {
	{ name="Dragon Darashia", position = Position(33268, 32281, 7)},
	{ name="Dragon Kingdom", position = Position(32021, 32470, 10)},
	{ name="Lizard Tiquanda", position = Position(33005, 32754, 6)},
	{ name="Hellhound INQ", position = Position(33231, 31635, 10)},
	{ name="Nightmare Isle", position = Position(33498, 32614, 8)},
	{ name="Grimeleech Lair", position = Position(33320, 31467, 14)},
	{ name="Grimeleech Isle", position = Position(32545, 31021, 7)},
	{ name="Bog Raider Lair", position = Position(33328, 31808, 12)},
	{ name="Deepling Kingdom", position = Position(33440, 31273, 14)},
	{ name="Minotaur Mintwallin", position = Position(32419, 32147, 15)},
	{ name="Demon Edron", position = Position(33144, 31699, 14)},
	{ name="Behemoth Edron", position = Position(33296, 31683, 14)},
	{ name="Diremaw Warzone", position = Position(33836, 32087, 15)},
	{ name="Wiggler Lair", position = Position(32956, 31921, 11)},
	{ name="Leaf Golems", position = Position(33182, 31981, 10)},
	{ name="Hydra Lair", position = Position(33509, 31886, 8)},
	{ name="Ogre Issavi", position = Position(33855, 31612, 8)},
	{ name="Infernal Demons", position = Position(34031, 31084, 11)},
	{ name="Many Faces Thais", position = Position(33963, 31168, 11)},
	{ name="Humongous Fungus", position = Position(33634, 31898, 11)},
	{ name="Feroxa Cave", position = Position(33432, 31568, 10)},
	{ name="Wyrm LB", position = Position(32370, 32725, 6)},
	{ name="Misguided Bully", position = Position(32492, 32334, 10)},
	{ name="Serpent Lair", position = Position(31943, 31029, 8)},
	{ name="Frosts Okolnir", position = Position(32228, 31385, 7)},
	{ name="Hive", position = Position(33518, 31170, 7)},
	{ name="Lamawood Isles", position = Position(31940, 31865, 7)},
	{ name="Lion Fort", position = Position(31788, 32068, 7)},
	{ name="Goroma", position = Position(32082, 32577, 8)},
	{ name="Lamassu Hideout", position = Position(32249, 33045, 8)},
	{ name="Lamassu Underground", position = Position(33857, 31520, 9)},
	{ name="Oramond Mountains", position = Position(33607, 31824, 6)},
	{ name="Venerable Girtablilu", position = Position(33821, 31695, 9)},
	{ name="Cursed Prospector", position = Position(33802, 31792, 8)},
	{ name="Undead Lair", position = Position(33691, 31851, 8)},
	{ name="Other Custom", position = Position(33483, 33020, 7)}
	
}

local teppppp6vip = MoveEvent()
function teppppp6vip.onStepIn(creature, item, position, fromPosition, target, toPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end

	local window = ModalWindow {
		title = "Hunt Teleport Portal",
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
teppppp6vip:type("stepin")
teppppp6vip:uid(43550)
teppppp6vip:register()


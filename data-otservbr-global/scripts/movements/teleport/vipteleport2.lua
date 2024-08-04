local config = {
	{ name="Thais", position = Position(32375, 32208, 6) },
	{ name="Venore", position = Position(32940, 32065, 5) },
    { name="Oskayaat", position = Position(33026, 32916, 4) },
	{ name="Kazordoon", position = Position(32627, 31916, 8) },
	{ name="Carlin", position = Position(32327, 31771, 5) },
	{ name="Abdendriel", position = Position(32726, 31650, 6) },
	{ name="Yalahar", position = Position(32794, 31245, 4) },
	{ name="Issavi", position = Position(33921, 31475, 5) },
	{ name="Feyrist", position = Position(33515, 32232, 6) },
	{ name="Rathleton", position = Position(33634, 31895, 7) },
    { name="Krailos", position = Position(33634, 31661, 8) },
	{ name="Roshamuul", position = Position(33553, 32382, 7) },
	{ name="Ankrahmun", position = Position(33150, 32843, 7) },
	{ name="Edron", position = Position(33174, 31786, 6) },
	{ name="Farmine", position = Position(33023, 31524, 10) },
	{ name="Darashia", position = Position(33241, 32402, 7) },
    { name="Liberty Bay", position = Position(32316, 32819, 6) },
    { name="Port Hope", position = Position(32628, 32738, 3) },
	{ name="Svargrond", position = Position(32294, 31158, 7) },
	{ name="Hellish Basin", position = Position(31455, 31761, 7) },
    { name="Old Vip Island", position = Position (32566, 32401, 5) }
	
}

local tepppvip = MoveEvent()
function tepppvip.onStepIn(creature, item, position, fromPosition, target, toPosition)
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
tepppvip:type("stepin")
tepppvip:uid(43536)
tepppvip:register()


local config = {
	{ name="Druid Hunt +100", position = Position(31997, 33141, 7) },
	{ name="Sorcerer Hunt 100+", position = Position(32251, 33045, 8) },
    { name="Knight Hunt 100+", position = Position(31536, 32515, 8) },
	{ name="Paladin Hunt 100+", position = Position(32545, 33079, 8) },
	{ name="Knight Hunt 200+", position = Position(32541, 33259, 8) },
	{ name="Paladin Hunt 200+", position = Position(32782, 33186, 8) },
	{ name="Sorcerer Hunt 200+", position = Position(32772, 33253, 8) },
	{ name="Druid Hunt 200+", position = Position(32913, 33111, 8) },
     { name="Team Hunt 150+", position = Position (32626, 33328, 8) },
	{ name="Team Hunt 250+", position = Position(32929, 33302, 8) },
	{ name="Team Hunt 400+", position = Position(33209, 33376, 8)},
    { name="Team Hunt 700+", position = Position(33582, 33021, 8) },
	{ name="Deepling Space-Time", position = Position(33323, 33255, 8) },
	{ name="Team Hunt 500+", position = Position(33292, 33074, 8) },
	{ name="Paladin Hunt 500+", position = Position(32985, 33433, 8) },
	{ name="Knight Hunt 500+", position = Position(33354, 33544, 8) },
	{ name="Sorcerer Hunt 500+", position = Position(33639, 33229, 8) },
    { name="Druid Hunt 500+", position = Position(33628, 33457, 8) },
	{ name="Asura Kingdom", position = Position(34507, 33227, 7) },
	{ name="Jungle Tunnels", position = Position(34626, 33046, 7) }
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


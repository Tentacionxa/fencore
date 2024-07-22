BATTLEFIELD_STATUS = {
    OPEN = "open", CLOSED = "closed", PREPARING = "preparing"
}

if not BATTLEFIELD then
    BATTLEFIELD = {
		positionTeleportOpen = Position(32369, 32237, 6),
		teleportTimeClose = 5,
		minutesOpenGate = 3,
		storage = 99901,
		lastPlayer = 99900, -- global storage
		levelMin = 100,
		reward = {3043, 15},{24390, 50},
		itemWall = 1608,
		walls = {
			Position(50, 1026, 6),
			Position(50, 1025, 6),
			Position(50, 1024, 6),
			Position(50, 1023, 6)
		},

		teamsBattlefield = {
			[1] = {
				color = "Green Assassins", 
				temple = Position(56, 1011, 6), 
				outfitMale = {lookType = 134, lookHead = 82, lookBody = 82, lookLegs = 82, lookFeet = 82}, 
				outfitFemale = {lookType = 142, lookHead = 82, lookBody = 82, lookLegs = 82, lookFeet = 82}
			},
			[2] = {
				color = "Blue Barbarians", 
				temple = Position(42, 1011, 6), 
				outfitMale = {lookType = 143, lookHead = 88, lookBody = 88, lookLegs = 88, lookFeet = 88}, 
				outfitFemale = {lookType = 147, lookHead = 88, lookBody = 88, lookLegs = 88, lookFeet = 88}
			},
		}
	}
end

function battlefield_teleportCheck()
	local tile = Tile(BATTLEFIELD.positionTeleportOpen)
	if tile then
		local item = tile:getItemById(1949)
		if item then
			item:remove()
			
			BATTLEFIELD.status = BATTLEFIELD_STATUS.PREPARING

			if (battlefield_totalPlayers() % 2) ~= 0 then
				battlefield_removePlayer(Game.getStorageValue(BATTLEFIELD.lastPlayer))
			end

			local totalPlayers = battlefield_totalPlayers()
			if totalPlayers > 0 then
				Game.broadcastMessage("Battlefield will start in ".. BATTLEFIELD.minutesOpenGate .." minutes, please create your strategy!", MESSAGE_STATUS_WARNING)

				Spdlog.info("> BattleField Event will begin now [".. totalPlayers .."].")

				addEvent(battlefield_checkGate, BATTLEFIELD.minutesOpenGate * 60000)
			else
				Spdlog.info("> BattleField Event ended up not having the participation of players.")
			end
		else			
			battlefield_openMsg(BATTLEFIELD.teleportTimeClose)

			Spdlog.info("> BattleField Event was opened teleport.")

			local teleport = Game.createItem(1949, 1, BATTLEFIELD.positionTeleportOpen)
			if teleport then
				teleport:setActionId(9612)
			end

			addEvent(battlefield_teleportCheck, BATTLEFIELD.teleportTimeClose * 60000)
		end
	end
end

function battlefield_openMsg(minutes)
	local totalPlayers = battlefield_totalPlayers()

	if minutes == BATTLEFIELD.teleportTimeClose then
		Game.broadcastMessage("The battlefield event was opened and will close in ".. minutes .." "..(minutes == 1 and "minute" or "minutes") ..".", MESSAGE_STATUS_WARNING)
	else
		Game.broadcastMessage("The battlefield event was opened and will close in ".. minutes .." ".. (minutes == 1 and "minute" or "minutes") ..". The event has ".. totalPlayers .." ".. (totalPlayers > 1 and "participants" or "participant") ..".", MESSAGE_STATUS_WARNING)
	end

	local minutesTime = minutes - 1
	if minutesTime > 0 then
		addEvent(battlefield_openMsg, 60000, minutesTime)
	end
end

function battlefield_removePlayer(uid)
	local player = Player(uid)
	if player then
		player:removeCondition(CONDITION_INFIGHT)
		player:addHealth(player:getMaxHealth())
		player:addMana(player:getMaxMana())
		player:unregisterEvent("Battlefield")
		player:unregisterEvent("BattlefieldOnPrepareDeath")
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(BATTLEFIELD.storage, 0)
		player:setOutfit(eventsOutfit[player:getGuid()])
	end
end

function battlefield_checkGate()
    local wall = BATTLEFIELD.walls
    for i = 1, #wall do
        local tile = Tile(wall[i])
        if tile then
            local item = tile:getItemById(BATTLEFIELD.itemWall)
            if item then
                item:remove()
                if i == 1 then
                    BATTLEFIELD.status = BATTLEFIELD_STATUS.OPEN
                    Game.broadcastMessage("The BattleEvent Event will begin now!", MESSAGE_STATUS_WARNING)
                    battlefield_msg()
                end
            else
                Game.createItem(BATTLEFIELD.itemWall, 1, wall[i])
            end
        end
    end
end

function battlefield_totalPlayers()
	local x = 0
	for _, player in ipairs(Game.getPlayers()) do
		if player:getStorageValue(BATTLEFIELD.storage) > 0 then
			x = x + 1
		end
	end
	return x
end

function battlefield_totalPlayersTeam(team)
	local x = 0
	for _, player in ipairs(Game.getPlayers()) do
		if player:getStorageValue(BATTLEFIELD.storage) == team then
			x = x + 1
		end
	end
	return x
end

function battlefield_msg()
	for _, participant in ipairs(Game.getPlayers()) do
		if participant:getStorageValue(BATTLEFIELD.storage) > 0 then
			participant:sendTextMessage(MESSAGE_INFO_DESCR, "[BattleField] ".. BATTLEFIELD.teamsBattlefield[1].color .." ".. battlefield_totalPlayersTeam(1) .." x ".. battlefield_totalPlayersTeam(2) .." " .. BATTLEFIELD.teamsBattlefield[2].color)
		end
	end
end

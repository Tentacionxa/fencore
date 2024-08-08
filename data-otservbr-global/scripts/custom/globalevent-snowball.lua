function startGame(rounds)
	if rounds == 0 then
		if #CACHE_GAMEPLAYERS < SnowBall_Configurations.Event_MinPlayers then
			for _, players in ipairs(CACHE_GAMEPLAYERS) do
				Player(players):teleportTo(Player(players):getTown():getTemplePosition())
			end
			broadcastMessage("[Snowball Event]: The event was canceled due to not having at least ".. SnowBall_Configurations.Event_MinPlayers.." players.", MESSAGE_EVENT_ADVANCE)
		else
			for _, players in ipairs(CACHE_GAMEPLAYERS) do
					Player(players):setStorageValue(10109, 0)
					Player(players):setStorageValue(10108, SnowBall_Configurations.Ammo_Configurations.Ammo_Start)
					Player(players):teleportTo(CACHE_GAMEAREAPOSITIONS[math.random(#CACHE_GAMEAREAPOSITIONS)])
			end
			broadcastMessage("[Snowball Event]: The event has closed. The game started. The game will take 10 minutes.", MESSAGE_EVENT_ADVANCE)
			addEvent(Event_endGame, 10 * 60 * 1000)
		end

		Item(getTileItemById(SnowBall_Configurations.Area_Configurations.Position_EventTeleport, 1949).uid):remove(1)
		Item(getTileItemById(SnowBall_Configurations.Area_Configurations.Position_ExitWaitRoom, 1949).uid):remove(1)
		return true
	end

	if #CACHE_GAMEPLAYERS < SnowBall_Configurations.Event_MinPlayers then
		broadcastMessage("[Snowball Event]: Missing ".. rounds .. " minute(s) and " .. SnowBall_Configurations.Event_MinPlayers - #CACHE_GAMEPLAYERS .." player(s) for the game start.", MESSAGE_EVENT_ADVANCE)
	else
		broadcastMessage("[Snowball Event]: Missing ".. rounds .. " minute(s) for the game start.", MESSAGE_EVENT_ADVANCE)
	end
	return addEvent(startGame, 60 * 1000, rounds - 1)
end

function START_SNOWBALL()
	CACHE_GAMEPLAYERS = {}

	local EventTeleport = Game.createItem(1949, 1, SnowBall_Configurations.Area_Configurations.Position_EventTeleport) -- actually, where is this snowball_configurations set?
	EventTeleport:setActionId(10101)

	local ExitWaitRoom = Game.createItem(1949, 1, SnowBall_Configurations.Area_Configurations.Position_ExitWaitRoom)
	ExitWaitRoom:setActionId(10102)

	broadcastMessage("[Snowball Event]: The event has opened, go to the teleport in the temple of Thais to participate.", MESSAGE_EVENT_ADVANCE)
	addEvent(startGame, 60 * 1000, SnowBall_Configurations.Event_WaitGame)
end


local snowball = GlobalEvent("Snowball")
function snowball.onTime(interval)
	if not SnowBall_Configurations.Event_Days[os.date("%w") + 1] then
		return true
	end

	START_SNOWBALL()
	
	return true
end

snowball:time("18:00") 
snowball:register()


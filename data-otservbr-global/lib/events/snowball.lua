-- This script is part of Snow Ball War
-- Copyright by Ciroc Developer
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

-- //

--i still didnt get  when the player should use !snowball... but lets find out

SnowBall_Configurations = {
	Event_Duration = 5,  -- 
	Event_WaitGame = 5, --
	Event_MinPlayers = 2, --
	Event_GainPoint = 1, 
	Event_LostPoints = 0, 
	Event_Days = {1, 2, 3, 4, 5, 6, 7}, 

	Area_Configurations = {
		Area_Arena = {Position(59, 1188, 7), Position(109, 1234, 7)}, --
		Position_WaitRoom = Position(83, 1211, 6),
		Position_ExitWaitRoom = Position(83, 1208, 6),
		Position_EventTeleport = Position(32371, 32237, 6) --
	}, 

	Ammo_Configurations = {
		Ammo_Price = 1,
		Ammo_Ammount = 100,
		Ammo_Start = 100,
		Ammo_Restart = 50,
		Ammo_Speed = 150,
		Ammo_Infinity = false,
		Ammo_Exhaust = 1,
		Ammo_Distance = 6,
	},

	Positions_Rewards = {
		[1] = { 
			[3043] = 20,
[24390] = 50,
		},
		[2] = { 
			[3043] = 15,
[24390] = 40,
		},
		[3] = { 
			[3043] = 10,
[24390] = 30,
		},
	},
}

-- ################# SnowBall Functions -- Developed by Tony Araujo (OrochiElf) ################# --
CACHE_GAMEPLAYERS = {}
CACHE_GAMEAREAPOSITIONS = {}

function snowballLoadEvent()
	Spdlog.info("[SnowBall Event]: Loading the arena area.")
	for newX = SnowBall_Configurations.Area_Configurations.Area_Arena[1].x, SnowBall_Configurations.Area_Configurations.Area_Arena[2].x do
		for newY = SnowBall_Configurations.Area_Configurations.Area_Arena[1].y, SnowBall_Configurations.Area_Configurations.Area_Arena[2].y do
			local AreaPos = {x = newX, y = newY, z = SnowBall_Configurations.Area_Configurations.Area_Arena[1].z}
			if getTileThingByPos(AreaPos).itemid == 0 then
				Spdlog.info("[SnowBall Event]: There was a problem loading the position (x = " .. AreaPos.x .. " - y = " .. AreaPos.y .." - z = " .. AreaPos.z .. ") of the event arena, please check the conditions.")
				return false
			elseif isWalkable(AreaPos) then
				table.insert(CACHE_GAMEAREAPOSITIONS, AreaPos)
			end
		end
	end
	Spdlog.info("[SnowBall Event]: Arena area loading completed successfully.")

	if getTileThingByPos(SnowBall_Configurations.Area_Configurations.Position_WaitRoom).itemid == 0 then
		Spdlog.info("[SnowBall Event]: There was a problem checking the existence of the waiting room position, please check the conditions.")
		return false
	end

	if getTileThingByPos(SnowBall_Configurations.Area_Configurations.Position_ExitWaitRoom).itemid == 0 then
		Spdlog.info("[SnowBall Event]: There was a problem checking the existence of the waiting room teleport position, please check the conditions.")
		return false
	end

	if getTileThingByPos(SnowBall_Configurations.Area_Configurations.Position_EventTeleport).itemid == 0 then
		Spdlog.info("[SnowBall Event]: There was a problem verifying the existence of the position for creating the event teleport, please check the conditions.")
		return false
	end

	Spdlog.info("[SnowBall Event]: Event loading completed successfully.")
	return true
end

local sampleConfigs = {
	[0] = {dirPos = {x = 0, y = -1}},
	[1] = {dirPos = {x = 1, y = 0}},
	[2] = {dirPos = {x = 0, y = 1}},
	[3] = {dirPos = {x = -1, y = 0}},
}

local iced_Corpses = {
	[0] = {
		[0] = {7303},
		[1] = {7306},
		[2] = {7303},
		[3] = {7306},
	},
	[1] = {
		[0] = {7305, 7307, 7309, 7311},
		[1] = {7308, 7310, 7312},
		[2] = {7305, 7307, 7309, 7311},
		[3] = {7308, 7310, 7312},
	},
}

function Event_sendSnowBall(cid, pos, rounds, dir)
	local player = Player(cid)

	if rounds == 0 then
		return true
	end

	if player then
		local sampleCfg = sampleConfigs[dir]

		if sampleCfg then
			local newPos = Position(pos.x + sampleCfg.dirPos.x, pos.y + sampleCfg.dirPos.y, pos.z)

			if isWalkable(newPos) then
				if Tile(newPos):getTopCreature() then
					local killed = Tile(newPos):getTopCreature()

					if Player(killed:getId()) then
						if iced_Corpses[killed:getSex()] then
							local killed_corpse = iced_Corpses[killed:getSex()][killed:getDirection()][math.random(#iced_Corpses[killed:getSex()][killed:getDirection()])]

							Game.createItem(killed_corpse, 1, killed:getPosition())
							local item = Item(getTileItemById(killed:getPosition(), killed_corpse).uid)
							addEvent(function() item:remove(1) end, 3000)
						end

						killed:getPosition():sendMagicEffect(3)
						killed:teleportTo(CACHE_GAMEAREAPOSITIONS[math.random(#CACHE_GAMEAREAPOSITIONS)])
						killed:getPosition():sendMagicEffect(53)
						killed:setStorageValue(10109, killed:getStorageValue(10109) - SnowBall_Configurations.Event_LostPoints)
						killed:setStorageValue(10108, SnowBall_Configurations.Ammo_Configurations.Ammo_Restart)
						killed:sendTextMessage(29, "You just got hit by the player " .. player:getName() .. " and lose -" .. SnowBall_Configurations.Event_LostPoints .." point(s).\nTotal of: " .. killed:getStorageValue(10109) .. " point(s)")

						player:setStorageValue(10109, player:getStorageValue(10109) + SnowBall_Configurations.Event_GainPoint)
						player:sendTextMessage(29, "You just hit the player " .. killed:getName() .. " and won +" .. SnowBall_Configurations.Event_GainPoint .." point(s).\nTotal of: " .. player:getStorageValue(10109) .. " point(s)")

						if(CACHE_GAMEPLAYERS[2] == player:getId()) and player:getStorageValue(10109) >= Player(CACHE_GAMEPLAYERS[1]):getStorageValue(10109) then
							player:getPosition():sendMagicEffect(7)
							player:sendTextMessage(29, "You are now the leader of the ranking of SnowBall, congratulations!")
							Player(CACHE_GAMEPLAYERS[1]):getPosition():sendMagicEffect(16)
							Player(CACHE_GAMEPLAYERS[1]):sendTextMessage(29, "You just lost the first place!")
						end

						table.sort(CACHE_GAMEPLAYERS, function(a, b) return Player(a):getStorageValue(10109) > Player(b):getStorageValue(10109) end)
					else

						newPos:sendMagicEffect(3)
					end
					return true
				end

				pos:sendDistanceEffect(newPos, 13)
				pos = newPos
				return addEvent(Event_sendSnowBall, SnowBall_Configurations.Ammo_Configurations.Ammo_Speed, player:getId(), pos, rounds - 1, dir)
			end

			newPos:sendMagicEffect(3)
			return true
		end
	end
	return true
end

function Event_endGame()
	local str = "       ## -> SnowBall Ranking <- ##\n\n"

	for rank, players in ipairs(CACHE_GAMEPLAYERS) do
		if SnowBall_Configurations.Positions_Rewards[rank] then
			for item_id, item_ammount in pairs(SnowBall_Configurations.Positions_Rewards[rank]) do

				Player(players):addItem(item_id, item_ammount)
			end
		end

		str = str .. rank .. ". " .. Player(players):getName() .. ": " .. Player(players):getStorageValue(10109) .. " point(s)\n"
		Player(players):teleportTo(Player(players):getTown():getTemplePosition())
	end

	for _, cid in ipairs(CACHE_GAMEPLAYERS) do
		Player(cid):showTextDialog(2111, str)
	end

	Game.broadcastMessage("[Snowball Event]: The event ended.")
	return true
end

function isWalkable(pos) --- New Function by Tony Ara�jo (OrochiElf)
	for i = 0, 255 do
		pos.stackpos = i

		local item = Item(getTileThingByPos(pos).uid)
		if item ~= nil then
			if item:hasProperty(2) or item:hasProperty(3) or item:hasProperty(7) then
				return false
			end
		end
	end
	return true
end

function isInArena(player)
	local pos = player:getPosition()

	if pos.z == SnowBall_Configurations.Area_Configurations.Area_Arena[1].z then
		if pos.x >= SnowBall_Configurations.Area_Configurations.Area_Arena[1].x and pos.y >= SnowBall_Configurations.Area_Configurations.Area_Arena[1].y then
			if pos.x <= SnowBall_Configurations.Area_Configurations.Area_Arena[2].x and pos.y <= SnowBall_Configurations.Area_Configurations.Area_Arena[2].y then
				return true
			end
		end
	end
	return false
end

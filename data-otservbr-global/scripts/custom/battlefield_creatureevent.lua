local battlefieldLogin = CreatureEvent("BattlefieldLogin")
function battlefieldLogin.onLogin(player)
	if player:getStorageValue(BATTLEFIELD.storage) > 0 then
		player:setStorageValue(BATTLEFIELD.storage, 0)
		player:teleportTo(player:getTown():getTemplePosition())
	end
	return true
end
battlefieldLogin:register()

local battlefieldLogout = CreatureEvent("BattlefieldLogout")
function battlefieldLogout.onLogout(player)
	if player:getStorageValue(BATTLEFIELD.storage) > 0 then
		player:sendCancelMessage("You can not logout in event!")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	return true
end
battlefieldLogout:register()

function battlefieldremoveAllPlayers()
    for _, player in ipairs(Game.getPlayers()) do
        if player:getStorageValue(BATTLEFIELD.storage) > 0 then
            battlefield_removePlayer(player:getGuid())
        end
    end

    BATTLEFIELD.status = BATTLEFIELD_STATUS.CLOSED
end

local function battlefield_winners(team)
	for _, winner in ipairs(Game.getPlayers()) do
		if winner:getStorageValue(BATTLEFIELD.storage) == team then	
			winner:sendTextMessage(MESSAGE_INFO_DESCR, "Congratulations, your team won the battlefield event.")
			winner:addItem(BATTLEFIELD.reward[1], BATTLEFIELD.reward[2])
			battlefield_removePlayer(winner:getGuid())
		end
	end

	Game.broadcastMessage("The BattleEvent is finish, team ".. BATTLEFIELD.teamsBattlefield[team].color .." win.", MESSAGE_STATUS_WARNING)
	battlefield_checkGate()

	Spdlog.info("> BattleField Event was finished.")

	addEvent(battlefield_removeAllPlayers, 3000)
end

local battlefieldOnPrepareDeath = CreatureEvent("BattlefieldOnPrepareDeath")
function battlefieldOnPrepareDeath.onPrepareDeath(player, killer)
	if BATTLEFIELD.status ~= BATTLEFIELD_STATUS.OPEN then return true end
	if player:getStorageValue(BATTLEFIELD.storage) <= 0 then return true end

	if killer then
		local team = player:getStorageValue(BATTLEFIELD.storage)
		if team > 0 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are dead in battlefield event!")
			battlefield_removePlayer(player:getGuid())

			if battlefield_totalPlayersTeam(team) == 0 then
				battlefield_winners((team == 1) and 2 or 1)
			else
				battlefield_msg()
			end
		end
	end
	return false
end
battlefieldOnPrepareDeath:register()
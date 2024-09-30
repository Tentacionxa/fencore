local activedExpBonus = 5 -- false is desatived

local playersCasting = {}

local Help_Messages = {
	"Available commands:\n",
	"!cast on - enables the stream",
	"!cast off - disables the stream",
	"!cast desc, description - sets description about your cast",
	"!cast password, password - sets a password on the stream",
	"!cast password off - disables the password protection",
	"!cast kick, name - kick a spectator from your stream",
	"!cast ban, name - locks spectator IP from joining your stream",
	"!cast unban, name - removes banishment lock",
	"!cast bans - shows banished spectators list",
	"!cast mute, name - mutes selected spectator from chat",
	"!cast unmute, name - removes mute",
	"!cast mutes - shows muted spectators list",
	"!cast show - displays the amount and nicknames of current spectators",
	"!cast status - displays stream status",
}

local talkaction = TalkAction("!cast")

function talkaction.onSay(player, words, param)

	local exaust = player:getExhaustion("cast-system-exhaustion")
	if exaust > 0 then
		player:sendCancelMessage("You must wait " .. exaust .. " " .. (exaust > 1 and "seconds" or "second") .. " to use the command again.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	player:setExhaustion("cast-system-exhaustion", 20)

	local split = param:splitTrimmed(",")
	local data = player:getCastViewers()

	if table.contains({"help"}, split[1]) then
		player:popupFYI(table.concat(Help_Messages, "\n"))

	elseif table.contains({"off", "no", "disable"}, split[1]) then
		if not data.broadcast then
			player:sendTextMessage(MESSAGE_STATUS, "You already have the live stream closed.")
			return true
		end
		data.mutes = {}
		data.broadcast = false
		player:setCastViewers(data)
		db.query("UPDATE `players` SET `cast_status` = 0, `cast_viewers` = 0 WHERE `id` = " .. player:getGuid())
		db.query("UPDATE `players` SET `cast_description` = '' WHERE `id` = " .. player:getGuid())
		player:sendTextMessage(MESSAGE_STATUS, "Your stream is currently disabled.")
		if activedExpBonus and activedExpBonus > 0 then
			player:sendTextMessage(MESSAGE_LOOK, "Experience bonus deactivated: -5%")
		end
		playersCasting[player:getGuid()] = nil

	elseif table.contains({"on", "yes", "enable"}, split[1]) then
		if data.broadcast then
			player:sendTextMessage(MESSAGE_STATUS, "You already have the live stream open.")
			return true
		end
		data.broadcast = true
		player:setCastViewers(data)
		player:sendTextMessage(MESSAGE_STATUS, "You have started live broadcast.")
		db.query("UPDATE `players` SET `cast_status` = 1 WHERE `id` = " .. player:getGuid())
		db.query("UPDATE `players` SET `cast_description` = '' WHERE `id` = " .. player:getGuid())
		if activedExpBonus and activedExpBonus > 0 then
			player:sendTextMessage(MESSAGE_LOOK, "Experience bonus actived: +5%")
		end
		playersCasting[player:getGuid()] = true

	elseif table.contains({"show", "count", "see"}, split[1]) then
		if data.broadcast then
			local count = table.maxn(data.names)
			if count > 0 then
				player:sendTextMessage(MESSAGE_STATUS, "You are currently watched by " .. count .. " people.")
				local str = ""
				for _, name in ipairs(data.names) do
					str = str .. (str:len() > 0 and ", " or "") .. name
				end

				player:sendTextMessage(MESSAGE_STATUS, str .. ".")
			else
				player:sendTextMessage(MESSAGE_STATUS, "None is watching your stream right now.")
			end
		else
			player:sendTextMessage(MESSAGE_STATUS, "You are not streaming right now.")
		end

	elseif table.contains({"kick", "remove"}, split[1]) then
		if data.broadcast then
			if split[2] then
				if split[2] ~= "all" then
					local found = false
					for _, name in ipairs(data.names) do
						if split[2]:lower() == name:lower() then
							found = true
							break
						end
					end

					if found then
						table.insert(data.kick, split[2])
						player:setCastViewers(data)
						player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " has been kicked.")
					else
						player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " not found.")
					end
				else
					data.kick = data.names
					player:setCastViewers(data)
					player:sendTextMessage(MESSAGE_STATUS, "All players has been kicked.")
				end
			else
				player:sendTextMessage(MESSAGE_STATUS, "You need to type a name.")
			end
		else
			player:sendTextMessage(MESSAGE_STATUS, "You are not streaming right now.")
		end

	elseif table.contains({"ban", "block"}, split[1]) then
		if data.broadcast then
			if split[2] then
				local found = false
				for _, name in ipairs(data.names) do
					if split[2]:lower() == name:lower() then
						found = true
						break
					end
				end

				if found then
					table.insert(data.bans, split[2])
					player:setCastViewers(data)
					player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " has been banned.")
				else
					player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " not found.")
				end
			else
				player:sendTextMessage(MESSAGE_STATUS, "You need to type a name.")
			end
		else
			player:sendTextMessage(MESSAGE_STATUS, "You are not streaming right now.")
		end

	elseif table.contains({"unban", "unblock"}, split[1]) then
		if data.broadcast then
			if split[2] then
				local found, i = 0, 1
				for _, name in ipairs(data.bans) do
					if(split[2]:lower() == name:lower()) then
						found = i
						break
					end

					i = i + 1
				end

				if found > 0 then
					table.remove(data.bans, found)
					player:setCastViewers(data)
					player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " has been unbanned.")
				else
					player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " not found.")
				end
			else
				player:sendTextMessage(MESSAGE_STATUS, "You need to type a name.")
			end
		else
			player:sendTextMessage(MESSAGE_STATUS, "You are not streaming right now.")
		end

	elseif table.contains({"bans", "banlist"}, split[1]) then
		if table.maxn(data.bans) then
			local str = ""
			for _, name in ipairs(data.bans) do
				str = str .. (str:len() > 0 and ", " or "") .. name
			end

			player:sendTextMessage(MESSAGE_STATUS, "Currently banned spectators: " .. str .. ".")
		else
			player:sendTextMessage(MESSAGE_STATUS, "Your ban list is empty.")
		end

	elseif table.contains({"mute", "squelch"}, split[1]) then
		if data.broadcast then
			if split[2] then
				local found = false
				for _, name in ipairs(data.names) do
					if split[2]:lower() == name:lower() then
						found = true
						break
					end
				end

				if found then
					table.insert(data.mutes, split[2])
					player:setCastViewers(data)
					player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " has been muted.")
				else
					player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " not found.")
				end
			else
				player:sendTextMessage(MESSAGE_STATUS, "You need to type a name.")
			end
		else
			player:sendTextMessage(MESSAGE_STATUS, "You are not streaming right now.")
		end

	elseif table.contains({"unmute", "unsquelch"}, split[1]) then
		if data.broadcast then
			if split[2] then
				local found, i = 0, 1
				for _, name in ipairs(data.mutes) do
					if split[2]:lower() == name:lower() then
						found = i
						break
					end

					i = i + 1
				end

				if found > 0 then
					table.remove(data.mutes, found)
					player:setCastViewers(data)
					player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " has been unmuted.")
				else
					player:sendTextMessage(MESSAGE_STATUS, "Spectator " .. split[2] .. " not found.")
				end
			else
				player:sendTextMessage(MESSAGE_STATUS, "You need to type a name.")
			end
		else
			player:sendTextMessage(MESSAGE_STATUS, "You are not streaming right now.")
		end

	elseif table.contains({"mutes", "mutelist"}, split[1]) then
		if table.maxn(data.mutes) then
			local str = ""
			for _, name in ipairs(data.mutes) do
				str = str .. (str:len() > 0 and ", " or "") .. name
			end

			player:sendTextMessage(MESSAGE_STATUS, "Currently muted spectators: " .. str .. ".")
		else
			player:sendTextMessage(MESSAGE_STATUS, "Your mute list is empty.")
		end

	elseif table.contains({"password", "guard"}, split[1]) then
		if split[2] then
			if table.contains({"off", "no", "disable"}, split[2]) then
				if data.password:len() ~= 0 then
					db.query("UPDATE `players` SET `cast_status` = 1 WHERE `id` = " .. player:getGuid())
					db.query("UPDATE `players` SET `cast_password` = '' WHERE `id` = " .. player:getGuid())
				end

				data.password = ""
				player:setCastViewers(data)
				player:sendTextMessage(MESSAGE_STATUS, "You have removed password for your stream.")
				if activedExpBonus and activedExpBonus > 0 then
					player:sendTextMessage(MESSAGE_STATUS, "Your experience bonus of 5% was reactivated.")
				end
			else
				data.password = string.trim(split[2])
				if data.password:len() ~= 0 then
					db.query("UPDATE `players` SET `cast_status` = 3 WHERE `id` = " .. player:getGuid())
				end
				player:setCastViewers(data)
				player:sendTextMessage(MESSAGE_STATUS, "You have set new password for your stream.")
				if activedExpBonus and activedExpBonus > 0 then
					player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Attention, Your experience bonus of 5% was deactivated.")
				end
				db.query("UPDATE `players` SET `cast_password` = " .. db.escapeString(data.password) .." WHERE `id` = " .. player:getGuid())
			end
		elseif data.password ~= "" then
			player:sendTextMessage(MESSAGE_STATUS, "Your stream is currently protected with password: " .. data.password .. ".")
		else
			player:sendTextMessage(MESSAGE_STATUS, "Your stream is currently not protected.")
		end

	elseif table.contains({"desc", "description"}, split[1]) then
		if split[2] then
			-- print(split[2])
			if table.contains({"remove", "delete"}, split[2]) then
				db.query("UPDATE `players` SET `cast_description` = '' WHERE `id` = " .. player:getGuid())
				player:sendTextMessage(MESSAGE_STATUS, "You have removed description for your stream.")
				data.description = ""
				player:setCastViewers(data)
			else
				if split[2]:match("[%a%d%s%u%l]+") ~= split[2] then
					player:sendTextMessage(MESSAGE_STATUS, "Please only A-Z 0-9.")
					return false
				end
				if split[2]:len() > 0 and split[2]:len() <= 50 then
					db.query("UPDATE `players` SET `cast_description` = \"".. split[2] .."\" WHERE `id` = " .. player:getGuid())
					data.description = split[2]
					player:setCastViewers(data)
				else
					player:sendTextMessage(MESSAGE_STATUS, "Your description max lenght 50 characters.")
					return false
				end
				player:sendTextMessage(MESSAGE_STATUS, "Cast description was set to: ".. split[2] ..".")
			end
		else
			player:sendTextMessage(MESSAGE_STATUS, "Please enter your description or if you want to remove your description type remove.")
		end

	elseif table.contains({"status", "info"}, split[1]) then
		player:sendTextMessage(MESSAGE_STATUS, "Your stream is currently " .. (data.broadcast and "enabled" or "disabled") .. ".")
	else
		player:popupFYI(table.concat(Help_Messages, "\n"))
	end

	return true
end

talkaction:separator(" ")
talkaction:groupType("normal")
talkaction:register()

local creaturescript = CreatureEvent("CastLogout")

function creaturescript.onLogout(player)
	db.query("UPDATE `players` set `cast_status` = 0, `cast_viewers` = 0, `cast_password` = '', `cast_description` = '' WHERE `id` = " .. player:getGuid())
	return true
end

creaturescript:register()

creaturescript = CreatureEvent("CastLogin")

function creaturescript.onLogin(player)
	player:registerEvent("CastLogout")
	return true
end

creaturescript:register()

local globalevent = GlobalEvent("CastThink")

function globalevent.onThink(interval)
	for playerGuid in pairs(playersCasting) do
		local player = Player(playerGuid)
		if player then
			local data = player:getCastViewers()
			if data.broadcast then
				db.query("UPDATE `players` set `cast_viewers` = " .. table.maxn(data.names) .. " WHERE `id` = " .. player:getGuid())
			end
		else
			playersCasting[playerGuid] = nil
		end
	end
	return true
end

globalevent:interval(10000)
globalevent:register()


local castOnStartup = GlobalEvent("CastOnStartup")

function castOnStartup.onStartup()
	db.query("UPDATE `players` set `cast_status` = 0, `cast_viewers` = 0")
	return true
end

castOnStartup:register()
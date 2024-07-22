local setLevel = TalkAction("/setlevel")
function setLevel.onSay(player, words, param)
	-- create log
	logCommand(player, words, param)

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return true
	end

	local player = Player(param:split(",")[1])
	if not player then logger.debug("Player with that name not found") return end

	local level = param:split(",")[2]
	if not level then logger.debug("You need to specify the level of the player") return end

	local experience = getExpForLevel(level)

	if (experience > player:getExperience()) then
		player:addExperience(experience - player:getExperience())
	else
		player:removeExperience(player:getExperience() - experience)
	end
	return true
end

setLevel:separator(" ")
setLevel:groupType("god")
setLevel:register()

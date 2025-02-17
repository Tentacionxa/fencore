local dolls = {
	[5080] = { "Hug me." },
	[5668] = {
		"It's not winning that matters, but winning in style.",
		"Today's your lucky day. Probably.",
		"Do not meddle in the affairs of dragons, for you are crunchy and taste good with ketchup.",
		"That is one stupid question.",
		"You'll need more rum for that.",
		"Do or do not. There is no try.",
		"You should do something you always wanted to.",
		"If you walk under a ladder and it falls down on you it probably means bad luck.",
		"Never say 'oops'. Always say 'Ah, interesting!'",
		"Five steps east, fourteen steps south, two steps north and seventeen steps west!",
	},
	[6566] = {
		"Fchhhhhh!",
		"Zchhhhhh!",
		"Grooaaaaar*cough*",
		"Aaa... CHOO!",
		"You... will.... burn!!",
	},
	[6387] = { "Merry Christmas |PLAYERNAME|." },
	[6511] = {
		"Ho ho ho",
		"Jingle bells, jingle bells...",
		"Have you been naughty?",
		"Have you been nice?",
		"Merry Christmas!",
		"Can you stop squeezing me now... I'm starting to feel a little sick.",
	},
	[8146] = { "ARE YOU PREPARED TO FACE YOUR DESTINY?" },
	[8153] = {
		"It's news to me.",
		"News, updated as infrequently as possible!",
		"Extra! Extra! Read all about it!",
		"Fresh off the press!",
	},
	[8154] = {
		"Hail TibiaNordic!",
		"So cold..",
		"Run, mammoth!",
	},
	[21435] = {
		"I can hear their whisperings... Revenge!",
		"You shall feel pain and terror, |PLAYERNAME|",
		"I do not need a sword to slaughter you",
		"My sword is broken, but my spirit is not dead",
		"I can say 469 and more...",
		"My dark magic lies on tibialatina.wikia.com",
	},
	[21962] = { "Hail Tibia Brasileiros! (União&Força)" },
	[32918] = {
		"COME HERE! FREE ITEMS FOR EVERYONE!",
		"DON'T BE AFRAID! I AM COMING IN PEACE!",
		"BOW TO THE POWER OF THE RUTHLESS SEVEN!",
		"Slay your friends and I will spare you!",
	},
}

local doll = Action()

function doll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local sounds = dolls[item.itemid]
	if not sounds then
		return false
	end

	if fromPosition.x == CONTAINER_POSITION then
		fromPosition = player:getPosition()
	end

	local random = math.random(#sounds)
	local sound = sounds[random]
	if item.itemid == 6566 then
		if random == 3 then
			fromPosition:sendMagicEffect(CONST_ME_POFF)
		elseif random == 4 then
			fromPosition:sendMagicEffect(CONST_ME_FIREAREA)
		elseif random == 5 then
			doTargetCombatHealth(0, player, COMBAT_PHYSICALDAMAGE, -1, -1, CONST_ME_EXPLOSIONHIT)
		end
	elseif item.itemid == 5668 then
		fromPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		item:transform(item.itemid + 1)
		item:decay()
	elseif item.itemid == 6387 then
		fromPosition:sendMagicEffect(CONST_ME_SOUND_YELLOW)
	end

	sound = sound:gsub("|PLAYERNAME|", player:getName())
	player:say(sound, TALKTYPE_MONSTER_SAY, false, 0, fromPosition)
	return true
end

for index, value in pairs(dolls) do
	doll:id(index)
end

doll:register()

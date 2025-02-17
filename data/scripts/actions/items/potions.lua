local berserk = Condition(CONDITION_ATTRIBUTES)
berserk:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserk:setParameter(CONDITION_PARAM_SUBID, JeanPierreMelee)
berserk:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserk:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
berserk:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local mastermind = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_SUBID, JeanPierreMagicLevel)
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
mastermind:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local terrorbird = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 5)
mastermind:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local bullseye = Condition(CONDITION_ATTRIBUTES)
bullseye:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
bullseye:setParameter(CONDITION_PARAM_SUBID, JeanPierreDistance)
bullseye:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
bullseye:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
bullseye:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local antidote = Combat()
antidote:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
antidote:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
antidote:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)
antidote:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
antidote:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)

local function magicshield(player)
	local condition = Condition(CONDITION_MANASHIELD)
	condition:setParameter(CONDITION_PARAM_TICKS, 60000)
	condition:setParameter(CONDITION_PARAM_MANASHIELD, math.min(player:getMaxMana(), 300 + 7.6 * player:getLevel() + 7 * player:getMagicLevel()))
	player:addCondition(condition)
end

local potions = {
	[236] = { health = { 250, 350 }, vocations = { VOCATION.BASE_ID.PALADIN, VOCATION.BASE_ID.KNIGHT }, level = 50, flask = 283, description = "Only knights and paladins of level 50 or above may drink this fluid." },
	[237] = { mana = { 200, 300 }, level = 50, flask = 283, description = "Only players of level 50 or above may drink this fluid." },
	[238] = { mana = { 350, 500 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID, VOCATION.BASE_ID.PALADIN }, level = 80, flask = 284, description = "Only sorcerers, druids and paladins of level 80 or above may drink this fluid." },
	[239] = { health = { 425, 575 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 80, flask = 284, description = "Only knights of level 80 or above may drink this fluid." },
	[266] = { health = { 125, 175 }, flask = 285 },
	[268] = { mana = { 75, 125 }, flask = 285 },
	[6558] = { transform = { id = { 236, 237 } }, effect = CONST_ME_DRAWBLOOD },
	[7439] = { vocations = { VOCATION.BASE_ID.KNIGHT }, condition = berserk, effect = CONST_ME_MAGIC_RED, description = "Only knights may drink this potion.", text = "You feel stronger.", achievement = "Berserker" },
	[7440] = { vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, condition = mastermind, effect = CONST_ME_MAGIC_BLUE, description = "Only sorcerers and druids may drink this potion.", text = "You feel smarter.", achievement = "Mastermind" },
[7443] = { vocations = { VOCATION.BASE_ID.PALADIN }, condition = bullseye, effect = CONST_ME_MAGIC_GREEN, description = "Only paladins may drink this potion.", text = "You feel more accurate.", achievement = "Sharpshooter" },
	[7642] = { health = { 250, 350 }, mana = { 100, 200 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 80, flask = 284, description = "Only paladins of level 80 or above may drink this fluid." },
	[7643] = { health = { 650, 850 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 130, flask = 284, description = "Only knights of level 130 or above may drink this fluid." },
	[7644] = { combat = antidote, flask = 285 },
	[7876] = { health = { 60, 90 }, flask = 285 },
	[23373] = { mana = { 900, 1100 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 130, flask = 284, description = "Only druids and sorcerers of level 130 or above may drink this fluid." },
	[23374] = { health = { 700, 800 }, mana = { 350, 500 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 130, flask = 284, description = "Only paladins of level 130 or above may drink this fluid." },
	[23375] = { health = { 1000, 1300 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 200, flask = 284, description = "Only knights of level 200 or above may drink this fluid." },
	[35563] = { vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 14, func = magicshield, effect = CONST_ME_ENERGYAREA, description = "Only sorcerers and druids of level 14 or above may drink this potion." },
	[46391] = { mana = { 1500, 1900 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 2000, flask = 284, description = "Only druids and sorcerers of level 2000 or above may drink this fluid." },
	[46390] = { health = { 1400, 1700 }, mana = { 700, 1000 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 2000, flask = 284, description = "Only paladins of level 2000 or above may drink this fluid." },
	[46389] = { health = { 1600, 2000 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 2000, flask = 284, description = "Only knights of level 2000 or above may drink this fluid." },
	[46394] = { mana = { 3700, 4500 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 4000, flask = 284, description = "Only druids and sorcerers of level 4000 or above may drink this fluid." },
	[46395] = { health = { 2500, 2800 }, mana = { 2600, 3000 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 4000, flask = 284, description = "Only paladins of level 4000 or above may drink this fluid." },
	[46393] = { health = { 3800, 4400 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 4000, flask = 284, description = "Only knights of level 4000 or above may drink this fluid." },
	[31354] = { mana = { 4600, 6500 }, vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID }, level = 5500, flask = 0, description = "Only druids and sorcerers of level 5500 or above may use this crystal." },
	[31356] = { health = { 3500, 3800 }, mana = { 3400, 4400 }, vocations = { VOCATION.BASE_ID.PALADIN }, level = 5500, flask = 0, description = "Only paladins of level 5500 or above may use this crystal." },
	[31355] = { health = { 5000, 6500 }, vocations = { VOCATION.BASE_ID.KNIGHT }, level = 5500, flask = 0, description = "Only knights of level 5500 or above may use this crystal." },
}

local flaskPotion = Action()

function flaskPotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target or type(target) == "userdata" and not target:isPlayer() then
		return false
	end

	local potion = potions[item:getId()]
	if not player:getGroup():getAccess() and (potion.level and player:getLevel() < potion.level or potion.vocations and not table.contains(potion.vocations, player:getVocation():getBaseId())) then
		player:say(potion.description, MESSAGE_POTION)
		return true
	end

	if potion.health or potion.mana or potion.combat then
		if potion.health then
			doTargetCombatHealth(player, target, COMBAT_HEALING, potion.health[1], potion.health[2], CONST_ME_MAGIC_BLUE)
		end

		if potion.mana then
			doTargetCombatMana(0, target, potion.mana[1], potion.mana[2], CONST_ME_MAGIC_BLUE)
		end

		if potion.combat then
			potion.combat:execute(target, Variant(target:getId()))
		end

		if not potion.effect and target:getPosition() ~= nil then
			target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end

		player:addAchievementProgress("Potion Addict", 100000)
		target:say("Aaaah...", MESSAGE_POTION)

		local deactivatedFlasks = player:kv():get("talkaction.potions.flask") or false
		if not deactivatedFlasks then
			local container = Container(item:getParent().uid)
			if container then
				local storeInbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
				if fromPosition.x == CONTAINER_POSITION and container ~= storeInbox and container:getEmptySlots() ~= 0 then
					container:addItem(potion.flask, 1)
				else
					player:addItem(potion.flask, 1)
				end
			else
				Game.createItem(potion.flask, 1, fromPosition)
			end
		end
	end

	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ITEM_USE_POTION, player:isInGhostMode() and nil or player)

	if potion.func then
		potion.func(player)
		player:say("Aaaah...", MESSAGE_POTION)
		player:getPosition():sendMagicEffect(potion.effect)

		if potion.achievement then
			player:addAchievementProgress(potion.achievement, 100)
		end
	end

	if potion.condition then
		player:addCondition(potion.condition)
		player:say(potion.text, MESSAGE_POTION)
		player:getPosition():sendMagicEffect(potion.effect)
	end

	if potion.transform then
		if item:getCount() >= 1 then
			item:remove(1)
			player:addItem(potion.transform.id[math.random(#potion.transform.id)], 1)
			item:getPosition():sendMagicEffect(potion.effect)
			player:addAchievementProgress("Demonic Barkeeper", 250)
			return true
		end
	end

	if not configManager.getBoolean(configKeys.REMOVE_POTION_CHARGES) then
		return true
	end

	player:updateSupplyTracker(item)
	item:remove(1)
	return true
end

for index, value in pairs(potions) do
	flaskPotion:id(index)
end

flaskPotion:register()

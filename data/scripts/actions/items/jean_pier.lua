local berserk = Condition(CONDITION_ATTRIBUTES)
berserk:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserk:setParameter(CONDITION_PARAM_SUBID, JeanPierreMelee)
berserk:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserk:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
berserk:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local terrorbird = Condition(CONDITION_ATTRIBUTES)
terrorbird:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
terrorbird:setParameter(CONDITION_PARAM_SUBID, JeanPierreMagicLevel)
terrorbird:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 5)
terrorbird:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

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
	[9082] = { vocations = { VOCATION.BASE_ID.SORCERER, VOCATION.BASE_ID.DRUID, VOCATION.BASE_ID.KNIGHT, VOCATION.BASE_ID.PALADIN }, condition = terrorbird, effect = CONST_ME_MAGIC_BLUE, description = "This yammy food will increase your magic level by 5 points up to 1 hour", text = "Yum."},
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

-- Instalacao automatica de tabelas se ainda nao as tivermos (primeira instalacao)
db.query([[
	CREATE TABLE IF NOT EXISTS `roleta_plays` (
		`id` int unsigned NOT NULL AUTO_INCREMENT,
		`player_id` int NOT NULL,
		`uuid` varchar(255) NOT NULL,
		`recompensa_id` smallint unsigned NOT NULL,
		`recompensa_quantidade` smallint unsigned NOT NULL,
		`recompensa_cargas` smallint unsigned NOT NULL DEFAULT '0',
		`status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 = rolling | 1 = pending | 2 = delivered',
		`created_at` bigint unsigned NOT NULL,
		`updated_at` bigint unsigned NOT NULL,
		PRIMARY KEY (`id`),
		UNIQUE KEY (`uuid`),
		CONSTRAINT `roleta_plays_players_fk`
		FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
	) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;
]])

-- #######################################################################################################

local machinesConfig = {
	[18433] = {
		itemNecessario = {id = 3043, quantidade = 25},
		pisosPorMachine = 3,
		posicaoDoCentro1 = Position(33449, 32491, 14),
		posicaoDoCentro2 = Position(33450, 32491, 14),
		posicaoDoCentro3 = Position(33451, 32491, 14),
		items = {
			{ id = 36725, quantidade = 3 }, -- stamina extension
			{ id = 36726, quantidade = 3 }, -- charm upgrade
{ id = 36728, quantidade = 4 }, -- charm upgrade
{ id = 36727, quantidade = 5 }, -- charm upgrade
{ id = 36725, quantidade = 5 }, -- charm upgrade
		}
	},

	
[18434] = {
		itemNecessario = {id = 3043, quantidade = 50},
		pisosPorMachine = 3,
		posicaoDoCentro1 = Position(33453, 32491, 14),
		posicaoDoCentro2 = Position(33454, 32491, 14),
		posicaoDoCentro3 = Position(33455, 32491, 14),
		items = {
			{ id = 23679, quantidade = 3 }, -- stamina extension
			{ id = 14758, quantidade = 1 }, -- charm upgrade
{ id = 3997, quantidade = 4 }, -- charm upgrade
{ id = 943, quantidade = 2 }, -- charm upgrade
{ id = 37317, quantidade = 1 }, -- charm upgrade
{ id = 8149, quantidade = 1 }, -- charm upgrade
		}
	},

[18435] = {
		itemNecessario = {id = 3043, quantidade = 50},
		pisosPorMachine = 3,
		posicaoDoCentro1 = Position(33457, 32491, 14),
		posicaoDoCentro2 = Position(33458, 32491, 14),
		posicaoDoCentro3 = Position(33459, 32491, 14),
		items = {
			{ id = 44613, quantidade = 4 }, -- stamina extension
			{ id = 44607, quantidade = 4 }, -- charm upgrade
{ id = 44610, quantidade = 3 }, -- charm upgrade
{ id = 44604, quantidade = 5 }, -- charm upgrade
		}
	},
[18436] = {
		itemNecessario = {id = 37317, quantidade = 20},
		pisosPorMachine = 3,
		posicaoDoCentro1 = Position(33461, 32491, 14),
		posicaoDoCentro2 = Position(33462, 32491, 14),
		posicaoDoCentro3 = Position(33463, 32491, 14),
		items = {
			{ id = 6529, quantidade = 1 }, -- stamina extension
			{ id = 39702, quantidade = 1 }, -- charm upgrade
{ id = 22118, quantidade = 2 }, -- charm upgrade
{ id = 23721, quantidade = 1 }, -- charm upgrade
{ id = 23683, quantidade = 3 }, -- charm upgrade
{ id = 19371, quantidade = 2 }, -- charm upgrade
		}
	}

}

-- #######################################################################################################

local Constantes = {
	PLAY_STATUS_ROLLING = 0,
	PLAY_STATUS_PENDING = 1,
	PLAY_STATUS_DELIVERED = 2,
}

-- #######################################################################################################

local random = math.random
local function generate_uuid()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

local function inserirRecompensaDaMachineNoBancoDeDados(uuid, playerId, recompensa)
	local tempoAgora = os.time()
	if not recompensa.cargas then
		recompensa.cargas = 0
	end
	db.query("INSERT INTO `roleta_plays` (`player_id`, `uuid`, `recompensa_id`, `recompensa_quantidade`, `recompensa_cargas`, `created_at`, `updated_at`) VALUES (" .. 
	playerId .. ", " .. db.escapeString(uuid) .. ", " .. recompensa.id .. ", " .. recompensa.quantidade .. ", " .. recompensa.cargas .. ", " .. tempoAgora .. ", " .. tempoAgora .. ");")
end

local function atualizarStatusDaEntregaDaRecompensaDaMachineNoBancoDeDados(uuid, status)
	db.query("UPDATE `roleta_plays` SET `status` = " .. status .. ", `updated_at` = " .. os.time() .. " WHERE `uuid` = " .. db.escapeString(uuid) .. ";")
end

local function retornarDadosDaRecompensaDaMachineNoBancoDeDados(uuid)
	local retornoDaConsulta = db.storeQuery("SELECT `player_id`, `recompensa_id`, `recompensa_quantidade`, `recompensa_cargas` FROM `roleta_plays` WHERE `uuid` = " .. db.escapeString(uuid) .. ";")
	if retornoDaConsulta then
		local guild = Result.getNumber(retornoDaConsulta, 'player_id')
		local recompensaId = Result.getNumber(retornoDaConsulta, 'recompensa_id')
		local recompensaQuantidade = Result.getNumber(retornoDaConsulta, 'recompensa_quantidade')
		local recompensaCargas = Result.getNumber(retornoDaConsulta, 'recompensa_cargas')
		Result.free(retornoDaConsulta)

		return {
			playerGuid = guild,
			uuid = uuid,
			id = recompensaId,
			quantidade = recompensaQuantidade,
			cargas = recompensaCargas
		}
	end
end

local function retornarDadosDaRecompensaDaMachineNoBancoDeDadosDeJogadoresComStatusDePendencia(playerGuid)
	local recompensas = {}

	local retornoDaConsulta = db.storeQuery("SELECT `uuid`, `recompensa_id`, `recompensa_quantidade`, `recompensa_cargas` FROM `roleta_plays` WHERE `player_id` = " .. playerGuid .. " AND `status` = 1;")
	if retornoDaConsulta then
		repeat
			local uuid = Result.getString(retornoDaConsulta, 'uuid')
			local recompensaId = Result.getNumber(retornoDaConsulta, 'recompensa_id')
			local recompensaQuantidade = Result.getNumber(retornoDaConsulta, 'recompensa_quantidade')
			local recompensaCargas = Result.getNumber(retornoDaConsulta, 'recompensa_cargas')

			recompensas[#recompensas + 1] = {
				uuid = uuid,
				id = recompensaId,
				quantidade = recompensaQuantidade,
				cargas = recompensaCargas
			}
		until not Result.next(retornoDaConsulta)
		Result.free(retornoDaConsulta)
	end

	return recompensas
end

local function atualizarJogadoresComMachineEmUsoNoBancoDeDados()
	db.query("UPDATE `roleta_plays` SET `status` = 1 WHERE `status` = 0;")
end

-- #######################################################################################################

local function entregarRecompensaDaMachine(player, recompensa)
	local item = Game.createItem(recompensa.id, recompensa.quantidade)
	if not item then
		return false
	end

	local cargasMensagem = "."
	if recompensa.cargas and recompensa.cargas > 0 then
		item:setAttribute(ITEM_ATTRIBUTE_CHARGES, recompensa.cargas)
		cargasMensagem = " with " .. recompensa.cargas .. " charges."
	end

	if player:addItemEx(item) ~= RETURNVALUE_NOERROR then
		player:sendTextMessage(MESSAGE_FAILURE, "The item could not be delivered. Check if your backpack has space and relogin.")
		atualizarStatusDaEntregaDaRecompensaDaMachineNoBancoDeDados(recompensa.uuid, Constantes.PLAY_STATUS_PENDING)
		return false
	end

	atualizarStatusDaEntregaDaRecompensaDaMachineNoBancoDeDados(recompensa.uuid, Constantes.PLAY_STATUS_DELIVERED)
	player:sendTextMessage(MESSAGE_LOOT, string.format("Congratulations, you received {%i|%i %s%s}",
		recompensa.id,
		recompensa.quantidade,
		ItemType(recompensa.id):getName(),
		cargasMensagem
	))

	return true
end

-- #######################################################################################################

local function gerarPosicoesDaMachine(actionId)
	local machine = machinesConfig[actionId]
	if not machine then
		return
	end

	local posDoCentro1 = machine.posicaoDoCentro1
	local posDoCentro2 = machine.posicaoDoCentro2
	local posDoCentro3 = machine.posicaoDoCentro3

	machine.posicoes1 = {}
	machine.posicoes2 = {}
	machine.posicoes3 = {}

	local half = math.floor(machine.pisosPorMachine / 2)

	machine.startPosition1 = Position(posDoCentro1.x, posDoCentro1.y - half, posDoCentro1.z)
	machine.endPosition1 = Position(posDoCentro1.x, posDoCentro1.y + half, posDoCentro1.z)

	for i = 0, machine.pisosPorMachine - 1 do
		local pos = machine.startPosition1 + Position(0, i, 0)
		local tile = Tile(pos)
		if tile then
			machine.posicoes1[#machine.posicoes1 + 1] = pos
		end
	end

	machine.startPosition2 = Position(posDoCentro2.x, posDoCentro2.y - half, posDoCentro2.z)
	machine.endPosition2 = Position(posDoCentro2.x, posDoCentro2.y + half, posDoCentro2.z)

	for i = 0, machine.pisosPorMachine - 1 do
		local pos = machine.startPosition2 + Position(0, i, 0)
		local tile = Tile(pos)
		if tile then
			machine.posicoes2[#machine.posicoes2 + 1] = pos
		end
	end

	machine.startPosition3 = Position(posDoCentro3.x, posDoCentro3.y - half, posDoCentro3.z)
	machine.endPosition3 = Position(posDoCentro3.x, posDoCentro3.y + half, posDoCentro3.z)

	for i = 0, machine.pisosPorMachine - 1 do
		local pos = machine.startPosition3 + Position(0, i, 0)
		local tile = Tile(pos)
		if tile then
			machine.posicoes3[#machine.posicoes3 + 1] = pos
		end
	end
end

local function limparManequinsDaMachine(posicoesDaMachine)
	for _, posicao in ipairs(posicoesDaMachine) do
		local tile = Tile(posicao)
		if tile then
			local manequim = tile:getTopCreature()
			if manequim then
				posicao:sendMagicEffect(CONST_ME_POFF)
				manequim:remove()
			end
		end
	end
end

local function SlotConstruirAnimacaoItems(machine, totalItems, recompensaId)
	local list = {}

	local metadeDosTiles = math.floor(machine.pisosPorMachine / 2)
	local itemsQuantidade = totalItems

	for i = 1, itemsQuantidade do
		local itemId = machine.items[math.random(#machine.items)].id
		if i == (itemsQuantidade - metadeDosTiles) then
			itemId = recompensaId
		end

		list[#list + 1] = itemId
	end

	return list
end

local function preparacaoDaEntregaDaRecompensaDaMachine(uuid)
	local recompensa = retornarDadosDaRecompensaDaMachineNoBancoDeDados(uuid)
	if not recompensa then
		return false
	end

	local player = Player(recompensa.playerGuid)
	if not player then
		atualizarStatusDaEntregaDaRecompensaDaMachineNoBancoDeDados(recompensa.uuid, Constantes.PLAY_STATUS_PENDING)
		return false
	end

	entregarRecompensaDaMachine(player, recompensa)
end

-- #######################################################################################################

local mType = Game.createMonsterType("Roleta Dummy")
local monster = {}

monster.description = "machine"
monster.experience = 0
monster.outfit = { lookTypeEx = 1551 }

monster.health = 100
monster.maxHealth = monster.health
monster.corpse = 0
monster.race = "undead"
monster.speed = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	summonable = false,
	attackable = false,
	hostile = true,
	convinceable = false,
	pushable = false,
	recompensaBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = true,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.immunities = {
	{type = 'physical', condition = true},
	{type = 'energy', condition = true},
	{type = 'fire', condition = true},
	{type = 'earth', condition = true},
	{type = 'ice', condition = true},
	{type = 'holy', condition = true},
	{type = 'death', condition = true},
	{type = 'paralyze', condition = true},
	{type = 'drunk', condition = true},
	{type = 'outfit', condition = true},
	{type = 'invisible', condition = true}
}

mType:register(monster)

-- #######################################################################################################

local function animacaoDoMovimentoDoManaquimDaMachine(machine, endPosition, velocidade)
	local posicao = Position(endPosition)
	for i = 1, machine.pisosPorMachine do
		local piso = Tile(posicao)
		if piso then
			local manequim = piso:getTopCreature()
			if manequim then
				if posicao.y == endPosition.y then
					manequim:remove()
				else
					manequim:setSpeed(velocidade)
					manequim:move(DIRECTION_SOUTH)
				end
			end
			posicao.y = posicao.y - 1
		end
	end
end

local function animacaoAoCriarUmManequim(positionCriarUmManequim, velocidadePadrao, lookTypeExReward)
	local manequim = Game.createMonster("Roleta Dummy", positionCriarUmManequim, false, true)
	if manequim then
		manequim:setSpeed(velocidadePadrao)
		manequim:setOutfit{lookTypeEx = lookTypeExReward}
	end
end

local function animacaoDeJogarFogosDeArtificioNaMachine(machine)
	local quantidade = 0

	local function decrease()
		if machine.emUso then
			return
		end

		local time = 20 - quantidade
		if time > 0 then
			quantidade = quantidade + 1
			for _, posicao in ipairs(machine.posicoes1) do
				posicao:sendMagicEffect(CONST_ME_PIXIE_EXPLOSION)
			end
			for _, posicao in ipairs(machine.posicoes2) do
				posicao:sendMagicEffect(CONST_ME_PIXIE_EXPLOSION)
			end
			for _, posicao in ipairs(machine.posicoes3) do
				posicao:sendMagicEffect(CONST_ME_PIXIE_EXPLOSION)
			end
			addEvent(decrease, 850)
		end
	end

	decrease()
end

local function AnimationDrawRecompensaHighlight(positionsTable, recompensaId)
	for _, posicao in ipairs(positionsTable) do
		local piso = Tile(posicao)
		if piso then
			local manequim = piso:getTopCreature()
			if manequim then
				manequim:setOutfit{lookTypeEx = recompensaId}
				manequim:getPosition():sendMagicEffect(CONST_ME_SPARKLING)
				manequim:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
			end
		end
	end
end

local function AnimationStart(args)
	local speeds = 1500
	local events = 200

	local machine = args.machine
	local recompensaId1 = args.recompensa1.id
	local recompensaId2 = args.recompensa2.id
	local recompensaId3 = args.recompensa3.id
	local animationItems1 = SlotConstruirAnimacaoItems(machine, 10, recompensaId1)
	local animationItems2 = SlotConstruirAnimacaoItems(machine, 15, recompensaId2)
	local animationItems3 = SlotConstruirAnimacaoItems(machine, 20, recompensaId3)
	local a = 1
	local b = 1
	local c = 1

	local function move1()
		animacaoDoMovimentoDoManaquimDaMachine(machine, machine.endPosition1, math.floor(speeds))
		animacaoAoCriarUmManequim(machine.startPosition1, math.floor(speeds), animationItems1[a])

		if a >= 10 then
			addEvent(function()
				machine.posicaoDoCentro1:sendMagicEffect(CONST_ME_PINK_FIREWORKS)
			end, 700)
		else
			addEvent(move1, math.floor(events))
		end

		a = a + 1
	end

	local function move2()
		animacaoDoMovimentoDoManaquimDaMachine(machine, machine.endPosition2, math.floor(speeds))
		animacaoAoCriarUmManequim(machine.startPosition2, math.floor(speeds), animationItems2[b])

		if b >= 15 then
			addEvent(function()
				machine.posicaoDoCentro2:sendMagicEffect(CONST_ME_PINK_FIREWORKS)
			end, 700)
		else
			addEvent(move2, math.floor(events))
		end

		b = b + 1
	end

	local function move3()
		animacaoDoMovimentoDoManaquimDaMachine(machine, machine.endPosition3, math.floor(speeds))
		animacaoAoCriarUmManequim(machine.startPosition3, math.floor(speeds), animationItems3[c])

		if c >= 20 then
			addEvent(function()
				machine.posicaoDoCentro3:sendMagicEffect(CONST_ME_PINK_FIREWORKS)
				addEvent(function()
					args.aoFinalizarJogada()
					if recompensaId1 == recompensaId2 and recompensaId1 == recompensaId3 then
						animacaoDeJogarFogosDeArtificioNaMachine(machine)
						AnimationDrawRecompensaHighlight(machine.posicoes1, recompensaId1)
						AnimationDrawRecompensaHighlight(machine.posicoes2, recompensaId2)
						AnimationDrawRecompensaHighlight(machine.posicoes3, recompensaId3)
					end
				end, 500)
			end, 700)
		else
			addEvent(move3, math.floor(events))
		end

		c = c + 1
	end

	move1()
	move2()
	move3()
end

-- #######################################################################################################

local function girarSlotMachine(player, machine, item)
	if not player then
		return false
	end

	if machine.emUso then
		player:sendCancelMessage("Wait to spin.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local recompensa1 = machine.items[math.random(#machine.items)]
	local recompensa2 = machine.items[math.random(#machine.items)]
	local recompensa3 = machine.items[math.random(#machine.items)]

	if not recompensa1 or not recompensa2 or not recompensa3 then
		player:sendTextMessage(MESSAGE_FAILURE, "Something is wrong, contact the administrator.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local itemNecessario = machine.itemNecessario

	if not player:removeItem(itemNecessario.id, itemNecessario.quantidade) then
		local itemNecessarioName = ItemType(itemNecessario.id):getName()
		player:sendTextMessage(MESSAGE_FAILURE, string.format("You need %i %s to spin.",
			itemNecessario.quantidade,
			itemNecessarioName
		))
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You need %i %s to spin.",
			itemNecessario.quantidade,
			itemNecessarioName
		))
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	machine.emUso = true

	item:transform(item.itemid == 8911 and 8912 or 8911)

	limparManequinsDaMachine(machine.posicoes1)
	limparManequinsDaMachine(machine.posicoes2)
	limparManequinsDaMachine(machine.posicoes3)

	local aoFinalizarJogada = nil
	if recompensa1.id == recompensa2.id and recompensa1.id == recompensa3.id then
		machine.uuid = generate_uuid()
		inserirRecompensaDaMachineNoBancoDeDados(machine.uuid, player:getGuid(), recompensa1)

		aoFinalizarJogada = function()
			preparacaoDaEntregaDaRecompensaDaMachine(machine.uuid)
			machine.emUso = false

			local cargaMensagem = ""
			if recompensa1.cargas and recompensa1.cargas > 0 then
				cargaMensagem = " with " .. recompensa1.cargas .. " charges"
			end

			local playerName = player:getName()
			local recompensaName = ItemType(recompensa1.id):getName()

			Game.broadcastMessage(string.format("[Slot Machine]: Player %s found %i %s%s, amazing.",
				playerName,
				recompensa1.quantidade,
				recompensaName,
				cargaMensagem
			), MESSAGE_GAME_HIGHLIGHT)
		end
	else
		aoFinalizarJogada = function()
			machine.emUso = false
		end
	end

	AnimationStart({
		machine = machine,
		recompensa1 = recompensa1,
		recompensa2 = recompensa2,
		recompensa3 = recompensa3,
		aoFinalizarJogada = aoFinalizarJogada
	})

	return true
end

local function slotMachineStartup()
	atualizarJogadoresComMachineEmUsoNoBancoDeDados()

	for actionId, _ in pairs(machinesConfig) do
		gerarPosicoesDaMachine(actionId)
	end
end

-- #######################################################################################################

local globalevent = GlobalEvent("SlotMachine")

function globalevent.onStartup()
	slotMachineStartup()
end

globalevent:register()

-- #######################################################################################################

local action = Action()

function action.onUse(player, item)
	local machine = machinesConfig[item.actionid]
	if not machine then
		player:sendTextMessage(MESSAGE_FAILURE, "Slot not implemented yet.")
		item:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	girarSlotMachine(player, machine, item)

	return true
end

for key in pairs(machinesConfig) do
	action:aid(key)
end

action:register()

-- #######################################################################################################

-- ja está sendo verificado no script da roleta
local creatureevent = CreatureEvent('Machine_Login')

function creatureevent.onLogin(player)
	local recompensaPendenteDaMachine = retornarDadosDaRecompensaDaMachineNoBancoDeDadosDeJogadoresComStatusDePendencia(player:getGuid())

	if #recompensaPendenteDaMachine > 0 then
		for _, recompensa in ipairs(recompensaPendenteDaMachine) do
			entregarRecompensaDaMachine(player, recompensa)
		end
	end

	return true
end

creatureevent:register()

-- #######################################################################################################

--[[
local ec = EventCallback
ec.onLook = function(self, thing, position, distance, description)
	if thing:getName() == "Roleta Dummy" then
		local item = ItemType(thing:getOutfit().lookTypeEx)

		return ('You see %s.\n%s'):format(
			item:getName(),
			item:getDescription()
		)
	end
	return description
end
ec:register(1)
]]--

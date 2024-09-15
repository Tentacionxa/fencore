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

local roletasConfig = {
	[17563] = {
		itemNecessario = {id = 3043, quantidade = 25},
		pisosPorRoleta = 9,
		posicaoDoCentro = Position(32346, 32222, 8),
		items = {
			{id = 3043, quantidade = 50, raro = true},

			{id = 35279, quantidade = 1, cargas = 5000}, -- durable exercise sword
			{id = 35280, quantidade = 1, cargas = 5000}, -- durable exercise axe
			{id = 35281, quantidade = 1, cargas = 5000}, -- durable exercise club
			{id = 35282, quantidade = 1, cargas = 5000}, -- durable exercise bow
			{id = 35283, quantidade = 1, cargas = 5000}, -- durable exercise rod
			{id = 35284, quantidade = 1, cargas = 5000}, -- durable exercise wand
			{id = 44066, quantidade = 1, cargas = 5000}, -- durable exercise shield

			{id = 36725, quantidade = 1, raro = true}, -- durable exercise sword
			{id = 36726, quantidade = 1, raro = true}, -- durable exercise axe
			{id = 36728, quantidade = 1, raro = true}, -- durable exercise club
			{id = 36727, quantidade = 1, raro = true}, -- durable exercise bow
			{id = 36725, quantidade = 1, raro = true}, -- durable exercise rod

		}
	},
	[16563] = {
		itemNecessario = {id = 3043, quantidade = 25},
		pisosPorRoleta = 9,
		posicaoDoCentro = Position(32356, 32222, 8),
		items = {
			{id = 3043, quantidade = 50, raro = true},

			{id = 35279, quantidade = 1, cargas = 5000}, -- durable exercise sword
			{id = 35280, quantidade = 1, cargas = 5000}, -- durable exercise axe
			{id = 35281, quantidade = 1, cargas = 5000}, -- durable exercise club
			{id = 35282, quantidade = 1, cargas = 5000}, -- durable exercise bow
			{id = 35283, quantidade = 1, cargas = 5000}, -- durable exercise rod
			{id = 35284, quantidade = 1, cargas = 5000}, -- durable exercise wand
			{id = 44066, quantidade = 1, cargas = 5000}, -- durable exercise shield

			{id = 36725, quantidade = 1, raro = true}, -- durable exercise sword
			{id = 36726, quantidade = 1, raro = true}, -- durable exercise axe
			{id = 36728, quantidade = 1, raro = true}, -- durable exercise club
			{id = 36727, quantidade = 1, raro = true}, -- durable exercise bow
			{id = 36725, quantidade = 1, raro = true}, -- durable exercise rod
		}
	}

	--[[
	[17322] = {
		itemNecessario = {id = 8978, quantidade = 1},
		pisosPorRoleta = 11,
		posicaoDoCentro = Position(875, 928, 7),
		items = ...
	},
	]]--
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

local function inserirRecompensaDaRoletaNoBancoDeDados(uuid, playerId, recompensa)
	local tempoAgora = os.time()
	if not recompensa.cargas then
		recompensa.cargas = 0
	end
	db.query("INSERT INTO `roleta_plays` (`player_id`, `uuid`, `recompensa_id`, `recompensa_quantidade`, `recompensa_cargas`, `created_at`, `updated_at`) VALUES (" ..
	playerId .. ", " .. db.escapeString(uuid) .. ", " .. recompensa.id .. ", " .. recompensa.quantidade .. ", " .. recompensa.cargas .. ", " .. tempoAgora .. ", " .. tempoAgora .. ");")
end

local function atualizarStatusDaEntregaDaRecompensaDaRoletaNoBancoDeDados(uuid, status)
	db.query("UPDATE `roleta_plays` SET `status` = " .. status .. ", `updated_at` = " .. os.time() .. " WHERE `uuid` = " .. db.escapeString(uuid) .. ";")
end

local function retornarDadosDaRecompensaDaRoletaNoBancoDeDados(uuid)
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

local function retornarDadosDaRecompensaDaRoletaNoBancoDeDadosDeJogadoresComStatusDePendencia(playerGuid)
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

local function atualizarJogadoresComRoletaEmUsoNoBancoDeDados()
	db.query("UPDATE `roleta_plays` SET `status` = 1 WHERE `status` = 0;")
end

-- #######################################################################################################

local function entregarRecompensaDaRoleta(player, recompensa)
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
		atualizarStatusDaEntregaDaRecompensaDaRoletaNoBancoDeDados(recompensa.uuid, Constantes.PLAY_STATUS_PENDING)
		return false
	end

	atualizarStatusDaEntregaDaRecompensaDaRoletaNoBancoDeDados(recompensa.uuid, Constantes.PLAY_STATUS_DELIVERED)
	player:sendTextMessage(MESSAGE_LOOT, string.format("Congratulations, you received {%i|%i %s%s}",
		recompensa.id,
		recompensa.quantidade,
		ItemType(recompensa.id):getName(),
		cargasMensagem
	))

	return true
end

-- #######################################################################################################

local function gerarPosicoesDaRoleta(actionId)
	local roleta = roletasConfig[actionId]
	if not roleta then
		return
	end

	local posDoCentro = roleta.posicaoDoCentro
	roleta.posicoes = {}

	local half = math.floor(roleta.pisosPorRoleta / 2)
	roleta.startPosition = Position(posDoCentro.x + half, posDoCentro.y, posDoCentro.z)
	roleta.endPosition = Position(posDoCentro.x - half, posDoCentro.y, posDoCentro.z)

	for i = 0, roleta.pisosPorRoleta - 1 do
		local pos = roleta.startPosition - Position(i, 0, 0)
		local tile = Tile(pos)
		if tile then
			roleta.posicoes[#roleta.posicoes + 1] = pos
		end
	end
end

local function limparManequinsDaRoleta(posicoesDaRoleta)
	for _, posicao in ipairs(posicoesDaRoleta) do
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

local function SlotConstruirAnimacaoItems(roleta, recompensaId)
	local list = {}

	local metadeDosTiles = math.floor(roleta.pisosPorRoleta / 2)
	local itemsQuantidade = 42

	for i = 1, itemsQuantidade do
		local itemId = roleta.items[math.random(#roleta.items)].id
		if i == (itemsQuantidade - metadeDosTiles) then
			itemId = recompensaId
		end

		list[#list + 1] = itemId
	end

	return list
end

local function preparacaoDaEntregaDaRecompensaDaRoleta(uuid)
	local recompensa = retornarDadosDaRecompensaDaRoletaNoBancoDeDados(uuid)
	if not recompensa then
		return false
	end

	local player = Player(recompensa.playerGuid)
	if not player then
		atualizarStatusDaEntregaDaRecompensaDaRoletaNoBancoDeDados(recompensa.uuid, Constantes.PLAY_STATUS_PENDING)
		return false
	end

	entregarRecompensaDaRoleta(player, recompensa)
end

-- #######################################################################################################

--[[
local mType = Game.createMonsterType("Roleta Dummy")
local monster = {}

monster.description = "roleta"
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
]]--

-- #######################################################################################################

local function animacaoDoMovimentoDoManaquimDaRoleta(roleta, velocidade)
	local posicao = Position(roleta.endPosition)
	for i = 1, roleta.pisosPorRoleta do
		local piso = Tile(posicao)
		if piso then
			local manequim = piso:getTopCreature()
			if manequim then
				if posicao.x == roleta.endPosition.x then
					posicao:sendMagicEffect(CONST_ME_TELEPORT)
					manequim:remove()
				else
					manequim:setSpeed(velocidade)
					manequim:move(DIRECTION_WEST)
				end
			end
			posicao.x = posicao.x + 1
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

local function animacaoDeJogarFogosDeArtificioNaRoleta(roleta)
	local quantidade = 0

	local function decrease()
		if roleta.emUso then
			return
		end

		local time = 20 - quantidade
		if time > 0 then
			quantidade = quantidade + 1
			for _, posicao in ipairs(roleta.posicoes) do
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
				manequim:getPosition():sendMagicEffect(CONST_ME_HEARTS)
				manequim:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
			end
		end
	end
end

local function AnimationStart(args)
	local speeds = {}
	local events = {}

	local initEvent = 12
	local initSpeed = 7000
	local formula = 1.1

	for i = 42, 1, -1 do
		initEvent = initEvent * formula
		initSpeed = initSpeed / formula

		events[#events + 1] = initEvent
		speeds[#speeds + 1] = initSpeed
	end

	-- little fix on animation middle
	for i, speed in ipairs(speeds) do
		if i > 13 and i < 28 then
			speeds[i] = speed * 1.65
		end
	end

	local roleta = args.roleta
	local recompensaId = args.recompensa.id
	local animationItems = SlotConstruirAnimacaoItems(roleta, recompensaId)
	local i = 1
	local function move()
		animacaoDoMovimentoDoManaquimDaRoleta(roleta, math.floor(speeds[i]))
		animacaoAoCriarUmManequim(roleta.startPosition, math.floor(speeds[i]), animationItems[i])
		if i >= 42 then
			addEvent(function()
				roleta.startPosition:sendDistanceEffect(roleta.posicaoDoCentro, CONST_ANI_SMALLICE)
				roleta.endPosition:sendDistanceEffect(roleta.posicaoDoCentro, CONST_ANI_SMALLICE)
				roleta.posicaoDoCentro:sendMagicEffect(CONST_ME_PINK_BEAM)

				addEvent(function()
					args.aoFinalizarJogada()
					if args.recompensa.raro then
						animacaoDeJogarFogosDeArtificioNaRoleta(roleta)
						AnimationDrawRecompensaHighlight(roleta.posicoes, recompensaId)
					end
				end, 500)
			end, 700)
		else
			addEvent(move, math.floor(events[i]))
		end

		i = i + 1
	end
	move()
end

-- #######################################################################################################

local function girarRoleta(player, roleta, item)
	if not player then
		return false
	end

	if roleta.emUso then
		player:sendCancelMessage("Wait to spin.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local recompensa = roleta.items[math.random(#roleta.items)]
	if not recompensa then
		player:sendTextMessage(MESSAGE_FAILURE, "Something is wrong, contact the administrator.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local itemNecessario = roleta.itemNecessario

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

	roleta.uuid = generate_uuid()
	inserirRecompensaDaRoletaNoBancoDeDados(roleta.uuid, player:getGuid(), recompensa)

	roleta.emUso = true
	item:transform(item.itemid == 8911 and 8912 or 8911)
	limparManequinsDaRoleta(roleta.posicoes)

	local aoFinalizarJogada = function()
		preparacaoDaEntregaDaRecompensaDaRoleta(roleta.uuid)
		roleta.emUso = false

		if recompensa.raro then
			local cargaMensagem = ""
			if recompensa.cargas and recompensa.cargas > 0 then
				cargaMensagem = " with " .. recompensa.cargas .. " charges"
			end

			local playerName = player:getName()
			local recompensaName = ItemType(recompensa.id):getName()

			Game.broadcastMessage(string.format("[Roulette]: Player %s found %i %s%s, amazing.",
				playerName,
				recompensa.quantidade,
				recompensaName,
				cargaMensagem
			), MESSAGE_GAME_HIGHLIGHT)
		end
	end

	AnimationStart({
		roleta = roleta,
		recompensa = recompensa,
		aoFinalizarJogada = aoFinalizarJogada
	})

	return true
end

local function roletaStartup()
	atualizarJogadoresComRoletaEmUsoNoBancoDeDados()

	for actionId, _ in pairs(roletasConfig) do
		gerarPosicoesDaRoleta(actionId)
	end
end

-- #######################################################################################################

local globalevent = GlobalEvent("MagicRoulette")

function globalevent.onStartup()
	roletaStartup()
end

globalevent:register()

-- #######################################################################################################

local action = Action()

function action.onUse(player, item)
	local roleta = roletasConfig[item.actionid]
	if not roleta then
		player:sendTextMessage(MESSAGE_FAILURE, "Slot not implemented yet.")
		item:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	girarRoleta(player, roleta, item)

	return true
end

for key in pairs(roletasConfig) do
	action:aid(key)
end

action:register()

-- #######################################################################################################

--[[
ocal creatureevent = CreatureEvent('Roleta_Login')

function creatureevent.onLogin(player)
	local recompensaPendenteDaRoleta = retornarDadosDaRecompensaDaRoletaNoBancoDeDadosDeJogadoresComStatusDePendencia(player:getGuid())

	if #recompensaPendenteDaRoleta > 0 then
		for _, recompensa in ipairs(recompensaPendenteDaRoleta) do
			entregarRecompensaDaRoleta(player, recompensa)
		end
	end

	return true
end

creatureevent:register()
]]--

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

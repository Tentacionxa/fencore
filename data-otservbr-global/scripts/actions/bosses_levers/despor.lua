local config = {
	boss = {
		name = "Despor",
		position = Position(33213, 31034, 13),
	},
	requiredLevel = 250,

	playerPositions = {
		{ pos = Position(33260, 31061, 13), teleport = Position(33213, 31040, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33261, 31061, 13), teleport = Position(33213, 31040, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33262, 31061, 13), teleport = Position(33213, 31040, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33263, 31061, 13), teleport = Position(33213, 31040, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33264, 31061, 13), teleport = Position(33213, 31040, 13), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33201, 31022, 13),
		to = Position(33228, 31046, 13),
	},
	exit = Position(33206, 31044, 13),
}

local lever = BossLever(config)
lever:position({ x = 33259, y = 31061, z = 13 })
lever:register()

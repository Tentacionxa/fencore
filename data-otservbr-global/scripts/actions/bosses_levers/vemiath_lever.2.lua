local config = {
	boss = {
		name = "Vemiath",
		position = Position(33043, 32331, 15),
	},
	requiredLevel = 250,

	playerPositions = {
		{ pos = Position(33078, 32333, 15), teleport = Position(33043, 32338, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33077, 32333, 15), teleport = Position(33043, 32338, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33076, 32333, 15), teleport = Position(33043, 32338, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33075, 32333, 15), teleport = Position(33043, 32338, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(33074, 32333, 15), teleport = Position(33043, 32338, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33036, 32328, 15),
		to = Position(33052, 32344, 15),
	},
	exit = Position(33043, 32344, 15),
}

local lever = BossLever(config)
lever:position({ x = 33079, y = 32333, z = 15 })
lever:register()

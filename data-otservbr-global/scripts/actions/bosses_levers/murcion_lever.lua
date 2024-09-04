local config = {
	boss = {
		name = "Murcion",
		position = Position(33008, 32366, 15),
	},
	requiredLevel = 250,

	playerPositions = {
		{ pos = Position(32978, 32365, 15), teleport = Position(33008, 32369, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32977, 32365, 15), teleport = Position(33008, 32369, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32976, 32365, 15), teleport = Position(33008, 32369, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32975, 32365, 15), teleport = Position(33008, 32369, 15), effect = CONST_ME_TELEPORT },
		{ pos = Position(32974, 32365, 15), teleport = Position(33008, 32369, 15), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32999, 32358, 15),
		to = Position(33016, 32376, 15),
	},
	exit = Position(33009, 32374, 15),
}

local lever = BossLever(config)
lever:position({ x = 32979, y = 32365, z = 15 })
lever:register()

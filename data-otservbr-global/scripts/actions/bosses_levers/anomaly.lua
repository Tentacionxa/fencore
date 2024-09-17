local config = {
	boss = {
		name = "Anomaly",
		position = Position(32271, 31249, 14),
	},
	playerPositions = {
		{ pos = Position(32245, 31245, 14), teleport = Position(32271, 31257, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32245, 31246, 14), teleport = Position(32271, 31257, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32245, 31247, 14), teleport = Position(32271, 31257, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32245, 31248, 14), teleport = Position(32271, 31257, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32245, 31249, 14), teleport = Position(32271, 31257, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32258, 31237, 14),
		to = Position(32284, 31262, 14),
	},
	monsters = {
		{ name = "Spark of Destruction", pos = Position(32267, 31253, 14) },
		{ name = "Spark of Destruction", pos = Position(32274, 31255, 14) },
		{ name = "Spark of Destruction", pos = Position(32274, 31249, 14) },
		{ name = "Spark of Destruction", pos = Position(32267, 31249, 14) },
	},
	exit = Position(32261, 31250, 14),
}

local lever = BossLever(config)
lever:aid(14325)
lever:register()

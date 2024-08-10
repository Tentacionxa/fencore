local config = {
	boss = {
		name = "Ragiaz",
		position = Position(33481, 32334, 13),
	},
	requiredLevel = 250,
	playerPositions = {
		{ pos = Position(33456, 32356, 13), teleport = Position(33482, 32339, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33457, 32356, 13), teleport = Position(33482, 32339, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33458, 32356, 13), teleport = Position(33482, 32339, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33459, 32356, 13), teleport = Position(33482, 32339, 13), effect = CONST_ME_TELEPORT },
		{ pos = Position(33460, 32356, 13), teleport = Position(33482, 32339, 13), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(33468, 32319, 13),
		to = Position(33495, 32347, 13),
	},
	exit = Position(33319, 32318, 13),
}


local lever = BossLever(config)

lever:position(Position(33455, 32356, 13))
lever:register()

local config = {
	boss = {
		name = "The Rootkraken",
		position = Position(34021, 32165, 7),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(34009, 32242, 7), teleport = Position(34021, 32172, 7) },
		{ pos = Position(34009, 32243, 7), teleport = Position(34021, 32172, 7) },
		{ pos = Position(34009, 32244, 7), teleport = Position(34021, 32172, 7) },
		{ pos = Position(34009, 32245, 7), teleport = Position(34021, 32172, 7) },
		{ pos = Position(34009, 32246, 7), teleport = Position(34021, 32172, 7) },
	},
	specPos = {
		from = Position(34008, 32157, 7),
		to = Position(34035, 32178, 7),
	},
	exit = Position(34007, 32244, 7),
	exitTeleporter = Position(34021, 32176, 7),
}

local lever = BossLever(config)
lever:position(Position(34009, 32241, 7))
lever:register()

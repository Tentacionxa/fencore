local config = {
	boss = {
		name = "Sub Flam",
		position = Position(32173, 33577, 8),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(32175, 33636, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32176, 33636, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32177, 33636, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32178, 33636, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32179, 33636, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32174, 33637, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32175, 33637, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32176, 33637, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32177, 33637, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32178, 33637, 8), teleport = Position(32164, 33585, 8) },
		{ pos = Position(32179, 33637, 8), teleport = Position(32164, 33585, 8) },
	},
	specPos = {
		from = Position(32153, 33563, 8),
		to = Position(32197, 33594, 8),
	},
	exit = Position(32176, 33638, 8),
	exitTeleporter = Position(32161, 33587, 8),
}

local lever = BossLever(config)
lever:position(Position(32174, 33636, 8))
lever:register()

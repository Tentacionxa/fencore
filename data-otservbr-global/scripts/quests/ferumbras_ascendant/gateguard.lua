local config = {
	boss = {
		name = "gate guard",
		position = Position(32823, 33482, 4),
	},
	requiredLevel = 4000,
	playerPositions = {
		{ pos = Position(32862, 33480, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32863, 33480, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32864, 33480, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32862, 33481, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32863, 33481, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32864, 33481, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32862, 33482, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32863, 33482, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32864, 33482, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32862, 33483, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32863, 33483, 4), teleport = Position(32816, 33482, 4) },
		{ pos = Position(32864, 33483, 4), teleport = Position(32816, 33482, 4) },

	},
	monsters = {
		{ name = "rift invader", pos = Position(32815, 33483, 4) },
		{ name = "rift invader", pos = Position(32818, 33478, 4) },
		{ name = "rift invader", pos = Position(32815, 33480, 4)},
		{ name = "rift invader", pos = Position(32817, 33478, 4) },
		{ name = "rift invader", pos = Position(32820, 33483, 4) },
		{ name = "rift invader", pos = Position(32821, 33477, 4) },
		{ name = "rift invader", pos = Position(32819, 33479, 4) },
		{ name = "rift invader", pos = Position(32821, 33476, 4) },
		{ name = "rift invader", pos = Position(32820, 33486, 4) },
	},
	specPos = {
		from = Position(32804, 33465, 4),
		to = Position(32844, 33503, 4),
	},
	exit = Position(32815, 33477, 4),
}

local lever = BossLever(config)
lever:position(Position(32863, 33479, 4))
lever:register()
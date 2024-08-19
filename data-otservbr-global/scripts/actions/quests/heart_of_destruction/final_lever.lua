local config = {
	boss = {
		name = "World Devourer",
		position = Position(32271, 31347, 14),
	},
	timeAfterKill = 60,
	playerPositions = {
		{ pos = Position(32272, 31374, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32271, 31374, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32273, 31374, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32272, 31375, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32271, 31375, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32273, 31375, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32271, 31376, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32272, 31376, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32273, 31376, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32271, 31377, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32272, 31377, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32273, 31376, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32271, 31378, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32272, 31378, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
		{ pos = Position(32273, 31378, 14), teleport = Position(32271, 31351, 14), effect = CONST_ME_TELEPORT },
	},
	specPos = {
		from = Position(32260, 31336, 14),
		to = Position(32283, 31360, 14),
	},
	monsters = {
		{ name = "Spark Of Destruction", pos = Position(32275, 31352, 14) },
		{ name = "Spark Of Destruction", pos = Position(32266, 31352, 14) },
		{ name = "Spark Of Destruction", pos = Position(32270, 31342, 14) },
		{ name = "Spark Of Destruction", pos = Position(32278, 31347, 14) },
	},
	exit = Position(32281, 31348, 14),
}

local lever = BossLever(config)
lever:aid(14332)
lever:register()
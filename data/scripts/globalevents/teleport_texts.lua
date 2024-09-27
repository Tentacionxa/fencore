local effects = {
	{position = Position (32374, 32212, 7), text = 'VIP', effect = CONST_ME_TUTORIALARROW},
	{position = Position (32377, 32212, 7), text = 'VIP', effect = CONST_ME_TUTORIALARROW},
 
	{position = Position(32358, 32218, 7), text = '', effect = CONST_ME_STEPSHORIZONTAL},
{position = Position(32359, 32218, 7), text = '', effect = CONST_ME_STEPSHORIZONTAL},

	  {position = Position(32351, 32219, 7), text = 'Other', effect = CONST_ME_PURPLESMOKE},
 {position = Position(33466, 32494, 11), text = 'Mount', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(32208, 32296, 6), text = 'World Board', effect = CONST_ME_GROUNDSHAKER},

 {position = Position(32347, 32231, 7), text = 'Casino', effect = CONST_ME_CRAPS},
 {position = Position(32348, 32231, 7), text = 'Casino', effect = CONST_ME_CRAPS},
 {position = Position(32348, 32229, 5), text = 'Casino', effect = CONST_ME_CRAPS},
 {position = Position(32348, 32230, 5), text = 'Casino', effect = CONST_ME_CRAPS},
 
 {position = Position(31469, 31765, 7), text = 'Task', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(32342, 32229, 7), text = 'Task', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(32362, 32219, 7), text = 'Hunt', effect = CONST_ME_GREENSMOKE},
 {position = Position(32364, 32219, 7), text = 'Bosses', effect = CONST_ME_YELLOWSMOKE},
 {position = Position(32354, 32219, 7), text = 'Raids', effect = CONST_ME_BLACKSMOKE},
 {position = Position(32353, 32222, 7), text = 'VIP Blessing', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(32366, 32219, 7), text = 'Quests', effect = CONST_ME_ENERGYHIT},
 
 {position = Position(32373, 32232, 7), text = 'Low Level Reward', effect = CONST_ME_TUTORIALARROW},
 
 {position = Position(33447, 32488, 9), text = 'Blessing', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33453, 32488, 10), text = 'Blessing', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33454, 32492, 11), text = 'Blessing', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33457, 32492, 11), text = 'Blessing', effect = CONST_ME_GROUNDSHAKER},
 
 {position = Position(33450, 32481, 11), text = '25%', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33451, 32481, 11), text = 'More Skill', effect = CONST_ME_GROUNDSHAKER},
 
 {position = Position(33454, 32481, 11), text = '25%', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33455, 32481, 11), text = 'More Skill', effect = CONST_ME_GROUNDSHAKER},
 
 {position = Position(33451, 32484, 11), text = 'Stamina', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33452, 32484, 11), text = 'Recharge Zone', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33461, 32484, 11), text = 'Fencore Boss', effect = CONST_ME_GROUNDSHAKER},
 
 {position = Position(33455, 32482, 9), text = 'RL Hunt', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33461, 32488, 9), text = 'Town', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33455, 32494, 9), text = 'Custom Hunt', effect = CONST_ME_GROUNDSHAKER},
 
 {position = Position(32352, 32240, 7), text = 'Remove', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33437, 32485, 8), text = 'Remove', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(32353, 32211, 7), text = 'Remove', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(32399, 32218, 7), text = 'Remove', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(33437, 32491, 8), text = 'Remove', effect = CONST_ME_GROUNDSHAKER},
 {position = Position(32356, 32211, 7), text = 'Remove', effect = CONST_ME_GROUNDSHAKER},
 
 {position = Position(33457, 32502, 11), text = 'Nemesis Boss', effect = CONST_ME_GROUNDSHAKER},
 
			{position = Position(32356, 32219, 7), text = 'Daily Quest', effect = CONST_ME_BLACKSMOKE}, 
		 
 }
 
 local animatedText = GlobalEvent("AnimatedText") 
 function animatedText.onThink(interval)
	 for i = 1, #effects do
		 local settings = effects[i]
		 local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
		 if #spectators > 0 then
			 if settings.text then
				 for i = 1, #spectators do
					 spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
				 end
			 end
			 if settings.effect then
				 settings.position:sendMagicEffect(settings.effect)
			 end
		 end
	 end
	return true
 end
 
 animatedText:interval(2550)
 animatedText:register()
 
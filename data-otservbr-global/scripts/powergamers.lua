local globalEventOnThink = GlobalEvent("Experience+Online History GlobalEvent onThink")

function globalEventOnThink.onThink()
    db.query("UPDATE `players` SET `online_time`= `players`.`online_time` + 60  WHERE `id` IN (SELECT `player_id` FROM `players_online`);")
    return true
end

globalEventOnThink:interval(60 * 1000) -- every minute
globalEventOnThink:register()

local globalEventOnTime = GlobalEvent("Experience+Online History GlobalEvent onTime")

function globalEventOnTime.onTime(interval)
	-- experience history
	db.query("INSERT INTO `myaac_history_experience` (`player_id`, `experience`, `experience_change`, `level`, `date`) SELECT `id`, `players`.`experience`, (`players`.`experience`-`players`.`experience_last`), `players`.`level`, UNIX_TIMESTAMP(DATE_ADD(current_date,INTERVAL -1 DAY)) FROM `players` WHERE `players`.`experience`-`players`.`experience_last` <> 0 ORDER BY `id` ASC")

	db.query("UPDATE `players` SET `experience_last`= `experience`;")

	-- online time
	db.query("INSERT INTO `myaac_history_online` (`player_id`, `date`, `online_time`) SELECT `id`, UNIX_TIMESTAMP(DATE_ADD(current_date,INTERVAL -1 DAY)), `players`.`online_time` FROM `players` WHERE `players`.`online_time` > 0 ORDER BY `id` ASC")

	db.query("UPDATE `players` SET `online_time` = 0;")

	return true
end

globalEventOnTime:time("22:00") -- will be executed each day just after global save
globalEventOnTime:register()

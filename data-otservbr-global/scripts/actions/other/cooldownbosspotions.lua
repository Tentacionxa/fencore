local bosses = {'Faceless Bane', 'Tentugly\'s Head', 'The Duke Of The Depths', 'The Baron From Below', 'Urmahlullu The Weakened', 'Ravenous Hunger', 'Unaz The Mean', 'Vok The Freakish', 'Black Vixen', 'Sharpclaw', 'Darkfang', 'Bloodback', 'Irgix The Flimsy', 'The Fear Feaster', 'The Count Of The Core', 'Razzagorn', 'Mazoran', 'The Unwelcome', 'Drume', 'Magma Bubble', 'Goshnar\'s Cruelty', 'Timira The Many-Headed', 'Shulgrax', 'Scarlett Etzel', 'Grand Master Oberon', 'Ratmiral Blackwhiskers', 'Duke Krule', 'Alptramun', 'Maxxenius', 'Izcandar The Banished', 'Anomaly', 'World Devourer', 'Outburst', 'Eradicator', 'Rupture', 'King Zelos', 'Ferumbras Mortal Shell', 'Goshnar\'s Megalomania', 'Goshnar\'s Malice', 'Goshnar\'s Hatred', 'Lloyd', 'Lady Tenebris', 'The Enraged Thorn Knight', 'Dragonking Zyrtarch'}

local bosspotion = Action()
function bosspotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for _, name in pairs(bosses) do
		player:setBossCooldown(name, 0)
		player:sendTextMessage(19, "You can fight all the bosses again!")
		item:remove()
end
bosspotion:id(19371)
bosspotion:register()
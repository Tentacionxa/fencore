local elements = {
    {type = COMBAT_HOLYDAMAGE, distanceeffect = CONST_ANI_HOLY},
    {type = COMBAT_ICEDAMAGE, distanceeffect = CONST_ANI_ICE},
    {type = COMBAT_FIREDAMAGE, distanceeffect = CONST_ANI_FIRE},
    {type = COMBAT_ENERGYDAMAGE, distanceeffect = CONST_ANI_ENERGYBALL},
    {type = COMBAT_EARTHDAMAGE, distanceeffect = CONST_ANI_EARTH}
}

local combats = {}
for i = 1, #elements do
    local combat = Combat()
    combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
    combat:setParameter(COMBAT_PARAM_TYPE, elements[i].type)
    combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, elements[i].distanceeffect)
    combat:setFormula(COMBAT_FORMULA_DAMAGE, -200, 0, -350, 0)
    table.insert(combats, combat)
end

local elementsWand = Weapon(WEAPON_WAND)
function elementsWand.onUseWeapon(player, variant)
    local combat = combats[math.max(1, player:getStorageValue(57845))]
    if not combat then
        return false
    end
    return combat:execute(player, variant)
end

elementsWand:id(46344)
elementsWand:mana(25)
elementsWand:range(6)
elementsWand:level(2000)
elementsWand:register()

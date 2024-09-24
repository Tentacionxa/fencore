/**
 * Canary - A free and open-source MMORPG server emulator
 * Copyright (©) 2019-2024 OpenTibiaBR <opentibiabr@outlook.com>
 * Repository: https://github.com/opentibiabr/canary
 * License: https://github.com/opentibiabr/canary/blob/main/LICENSE
 * Contributors: https://github.com/opentibiabr/canary/graphs/contributors
 * Website: https://docs.opentibiabr.org/
 */

#include "pch.hpp"

#include "creatures/players/wheel/player_wheel.hpp"

void GemModifierResistanceStrategy::execute() {
	m_wheel.addResistance(m_combatType, m_resistance);
}

void GemModifierStatStrategy::execute() {
	m_wheel.addStat(m_stat, m_value);
}

void GemModifierRevelationStrategy::execute() {
	m_wheel.addRevelationBonus(m_affinity, m_value);
}

void GemModifierSpellBonusStrategy::execute() {
	m_wheel.addSpellBonus(m_spellName, m_bonus);
}

void WheelModifierContext::addStrategies(WheelGemBasicModifier_t modifier, const uint8_t grade) {
	double value = 1;
	if (grade == 1) {
		value = 1.1;
	} else if (grade == 2) {
		value = 1.2;
	} else if (grade == 3) {
		value = 1.5;
	}

	switch (modifier) {
		case WheelGemBasicModifier_t::General_PhysicalResistance: {
			g_logger().debug("[{}] General_PhysicalResistance: physical {} / grade {}", __FUNCTION__, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_PHYSICALDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_HolyResistance: {
			g_logger().debug("[{}] General_HolyResistance: holy {} / grade {}", __FUNCTION__, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_HOLYDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_DeathResistance: {
			g_logger().debug("[{}] General_DeathResistance: death {} / grade {}", __FUNCTION__, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_DEATHDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_FireResistance: {
			g_logger().debug("[{}] General_FireResistance: fire {} / grade {}", __FUNCTION__, 200 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 200 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_EarthResistance: {
			g_logger().debug("[{}] General_EarthResistance: earth {} / grade {}", __FUNCTION__, 200 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 200 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_IceResistance: {
			g_logger().debug("[{}] General_IceResistance: ice {} / grade {}", __FUNCTION__, 200 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 200 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_EnergyResistance: {
			g_logger().debug("[{}] General_EnergyResistance: energy {} / grade {}", __FUNCTION__, 200 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 200 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_HolyResistance_DeathWeakness: {
			g_logger().debug("[{}] General_HolyResistance_DeathWeakness: holy {} / death -100 / grade {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_HOLYDAMAGE, 150 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_DEATHDAMAGE, -100));
			break;
		}
		case WheelGemBasicModifier_t::General_DeathResistance_HolyWeakness: {
			g_logger().debug("[{}] General_DeathResistance_HolyWeakness: death {} / holy -100 / grade {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_DEATHDAMAGE, 150 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_HOLYDAMAGE, -100));
			break;
		}
		case WheelGemBasicModifier_t::General_FireResistance_EarthResistance: {
			g_logger().debug("[{}] General_FireResistance_EarthResistance: fire {} / earth {} / grade {}", __FUNCTION__, 100 * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 100 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_FireResistance_IceResistance: {
			g_logger().debug("[{}] General_FireResistance_IceResistance: fire {} / ice {} / grade {}", __FUNCTION__, 100 * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 100 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_FireResistance_EnergyResistance: {
			g_logger().debug("[{}] General_FireResistance_EnergyResistance: fire {} / energy {} / grade {}", __FUNCTION__, 100 * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 100 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_EarthResistance_IceResistance: {
			g_logger().debug("[{}] General_EarthResistance_IceResistance: earth {} / ice {} / grade {}", __FUNCTION__, 100 * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 100 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_EarthResistance_EnergyResistance: {
			g_logger().debug("[{}] General_EarthResistance_EnergyResistance: earth {} / energy {} / grade {}", __FUNCTION__, 100 * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 100 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_IceResistance_EnergyResistance: {
			g_logger().debug("[{}] General_IceResistance_EnergyResistance: ice {} / energy {} / grade {}", __FUNCTION__,100 * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 100 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_FireResistance_EarthWeakness: {
			g_logger().debug("[{}] General_FireResistance_EarthWeakness: fire +{} / earth -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_FireResistance_IceWeakness: {
			g_logger().debug("[{}] General_FireResistance_IceWeakness: fire +{} / ice -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_FireResistance_EnergyWeakness: {
			g_logger().debug("[{}] General_FireResistance_EnergyWeakness: fire {} / energy -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_EarthResistance_FireWeakness: {
			g_logger().debug("[{}] General_EarthResistance_FireWeakness: earth {} / fire -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_EarthResistance_IceWeakness: {
			g_logger().debug("[{}] General_EarthResistance_IceWeakness: earth {} / ice -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_EarthResistance_EnergyWeakness: {
			g_logger().debug("[{}] General_EarthResistance_EnergyWeakness: earth {} / energy -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_IceResistance_EarthWeakness: {
			g_logger().debug("[{}] General_IceResistance_EarthWeakness: ice {} / earth -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_IceResistance_FireWeakness: {
			g_logger().debug("[{}] General_IceResistance_FireWeakness: ice {} / fire -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_IceResistance_EnergyWeakness: {
			g_logger().debug("[{}] General_IceResistance_EnergyWeakness: ice {} / energy -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_EnergyResistance_EarthWeakness: {
			g_logger().debug("[{}] General_EnergyResistance_EarthWeakness: energy {} / earth -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_EnergyResistance_IceWeakness: {
			g_logger().debug("[{}] General_EnergyResistance_IceWeakness: energy {} / ice -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_EnergyResistance_FireWeakness: {
			g_logger().debug("[{}] General_EnergyResistance_FireWeakness: energy {} / fire -200 / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 300 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, -200));
			break;
		}
		case WheelGemBasicModifier_t::General_ManaDrainResistance: {
			g_logger().debug("[{}] General_ManaDrainResistance: mana drain {} / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_MANADRAIN, 300 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_LifeDrainResistance: {
			g_logger().debug("[{}] General_ManaDrainResistance: life drain {} / grade {}", __FUNCTION__, 300 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_LIFEDRAIN, 300 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_ManaDrainResistance_LifeDrainResistance: {
			g_logger().debug("[{}] General_ManaDrainResistance_LifeDrainResistance: mana drain {} / life drain {} / grade {}", __FUNCTION__, 150 * value, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_MANADRAIN, 150 * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_LIFEDRAIN, 150 * value));
			break;
		}
		case WheelGemBasicModifier_t::General_MitigationMultiplier: {
			g_logger().debug("[{}] General_MitigationMultiplier: mitigation {} / grade {}", __FUNCTION__, 500 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MITIGATION, 500 * value));
			break;
		}

		case WheelGemBasicModifier_t::Vocation_Health: {
			g_logger().debug("[{}] Vocation_Health: health {} / grade {}", __FUNCTION__, getHealthValue(m_vocation, modifier) * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::HEALTH, getHealthValue(m_vocation, modifier) * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Mana_FireResistance: {
			g_logger().debug("[{}] Vocation_Mana_FireResistance: mana {} / fire {} / grade {}", __FUNCTION__, getManaValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MANA, getManaValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Mana_EnergyResistance: {
			g_logger().debug("[{}] Vocation_Mana_EnergyResistance: mana {} / energy {} / grade {}", __FUNCTION__,  getManaValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MANA, getManaValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Mana_Earth_Resistance: {
			g_logger().debug("[{}] Vocation_Mana_Earth_Resistance: mana {} / earth {} / grade {}", __FUNCTION__, getManaValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MANA, getManaValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Mana_Ice_Resistance: {
			g_logger().debug("[{}] Vocation_Mana_Ice_Resistance: mana {} / ice {} / grade {}", __FUNCTION__, getManaValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MANA, getManaValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Mana: {
			g_logger().debug("[{}] Vocation_Mana: mana {} / grade {}", __FUNCTION__, getManaValue(m_vocation, modifier) * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MANA, getManaValue(m_vocation, modifier) * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Health_FireResistance: {
			g_logger().debug("[{}] Vocation_Health_FireResistance: health {} / fire {} / grade {}", __FUNCTION__, getHealthValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::HEALTH, getHealthValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Health_EnergyResistance: {
			g_logger().debug("[{}] Vocation_Health_EnergyResistance: health {} / energy {} / grade {}", __FUNCTION__, getHealthValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::HEALTH, getHealthValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Health_EarthResistance: {
			g_logger().debug("[{}] Vocation_Health_EarthResistance: health {} / earth {} / grade {}", __FUNCTION__, getHealthValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::HEALTH, getHealthValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Health_IceResistance: {
			g_logger().debug("[{}] Vocation_Health_IceResistance: health {} / ice {} / grade {}", __FUNCTION__, getHealthValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::HEALTH, getHealthValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Mixed: {
			g_logger().debug("[{}] Vocation_Mixed: health {} / mana {} / capacity {} / grade {}", __FUNCTION__, getHealthValue(m_vocation, modifier) * value, getManaValue(m_vocation, modifier) * value, getCapacityValue(m_vocation, modifier) * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::HEALTH, getHealthValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MANA, getManaValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::CAPACITY, getCapacityValue(m_vocation, modifier) * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Capacity_FireResistance: {
			g_logger().debug("[{}] Vocation_Capacity_FireResistance: capacity {} / fire {} / grade {}", __FUNCTION__, getCapacityValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::CAPACITY, getCapacityValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_FIREDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Capacity_EnergyResistance: {
			g_logger().debug("[{}] Vocation_Capacity_EnergyResistance: capacity {} / energy {} / grade {}", __FUNCTION__, getCapacityValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::CAPACITY, getCapacityValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ENERGYDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Capacity_EarthResistance: {
			g_logger().debug("[{}] Vocation_Capacity_EarthResistance: capacity {} / earth {} / grade {}", __FUNCTION__, getCapacityValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::CAPACITY, getCapacityValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_EARTHDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Capacity_IceResistance: {
			g_logger().debug("[{}] Vocation_Capacity_IceResistance: capacity {} / ice {} / grade {}", __FUNCTION__, getCapacityValue(m_vocation, modifier) * value, 100 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::CAPACITY, getCapacityValue(m_vocation, modifier) * value));
			m_strategies.push_back(std::make_unique<GemModifierResistanceStrategy>(m_wheel, CombatType_t::COMBAT_ICEDAMAGE, 100 * value));
			break;
		}
		case WheelGemBasicModifier_t::Vocation_Capacity: {
			g_logger().debug("[{}] Vocation_Capacity: capacity {} / grade {}", __FUNCTION__, getCapacityValue(m_vocation, modifier) * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::CAPACITY, getCapacityValue(m_vocation, modifier) * value));
			break;
		}

		default:
			g_logger().error("WheelModifierContext::setStrategy: Invalid basic modifier: {}", static_cast<uint8_t>(modifier));
	}
}

void WheelModifierContext::addStrategies(WheelGemSupremeModifier_t modifier, const uint8_t grade) {
	WheelSpells::Bonus bonus;

	double value = 1;
	if (grade == 1) {
		value = 1.1;
	} else if (grade == 2) {
		value = 1.2;
	} else if (grade == 3) {
		value = 1.5;
	}

	switch (modifier) {
		case WheelGemSupremeModifier_t::General_Dodge:
			g_logger().debug("[{}] General_Dodge: dodge +{} / grade: +{}%", __FUNCTION__, (28 * value) / 100, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::DODGE, 28 * value));
			break;
		case WheelGemSupremeModifier_t::General_CriticalDamage:
			g_logger().debug("[{}] General_CriticalDamage: critical extra damage +{}% / grade: {}", __FUNCTION__, (200 * value) / 100, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::CRITICAL_DAMAGE, 200 * value));
			break;
		case WheelGemSupremeModifier_t::General_LifeLeech:
			g_logger().debug("[{}] General_LifeLeech: life leech +{}% / grade: {}", __FUNCTION__, (200 * value) / 100, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::LIFE_LEECH, 200 * value));
			break;
		case WheelGemSupremeModifier_t::General_ManaLeech:
			g_logger().debug("[{}] General_ManaLeech: mana leech +{}% / grade: {}", __FUNCTION__, (80 * value) / 100, grade);
			m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MANA_LEECH, 80 * value));
			break;

		case WheelGemSupremeModifier_t::SorcererDruid_UltimateHealing:
			bonus.increase.heal = 5 * value;
			g_logger().debug("[{}] SorcererDruid_UltimateHealing: heal +{}% / grade: {}", __FUNCTION__, bonus.increase.heal, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Ultimate Healing", bonus));
			break;

		case WheelGemSupremeModifier_t::General_RevelationMastery_GiftOfLife:
			g_logger().debug("[{}] General_RevelationMastery_GiftOfLife: +150 green points / grade: {}", __FUNCTION__, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Green, 150 * value));
			break;

		case WheelGemSupremeModifier_t::Knight_AvatarOfSteel_Cooldown:
			bonus.decrease.cooldown = 900 * 1000;
			g_logger().debug("[{}] Knight_AvatarOfSteel_Cooldown: decrease cooldown -900s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Avatar of Steel", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Knight_AvatarOfSteel_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Knight_ExecutionersThrow_Cooldown:
			bonus.decrease.cooldown = 2 * 1000;
			g_logger().debug("[{}] Knight_ExecutionersThrow_Cooldown: decrease cooldown -2s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Executioner's Throw", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Knight_ExecutionersThrow_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Knight_ExecutionersThrow_DamageIncrease:
			bonus.increase.damage = 6 * value;
			g_logger().debug("[{}] Knight_ExecutionersThrow_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Executioner's Throw", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_ExecutionersThrow_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Knight_ExecutionersThrow_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Executioner's Throw", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Fierce_Berserk_DamageIncrease:
			bonus.increase.damage = 5 * value;
			g_logger().debug("[{}] Knight_Fierce_Berserk_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Fierce Berserk", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Fierce_Berserk_CriticalExtraDamage:
			bonus.increase.criticalDamage = 8 * value;
			g_logger().debug("[{}] Knight_Fierce_Berserk_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Fierce Berserk", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Berserk_DamageIncrease:
			bonus.increase.damage = 5 * value;
			g_logger().debug("[{}] Knight_Berserk_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Berserk", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Berserk_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Knight_Berserk_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Berserk", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Front_Sweep_DamageIncrease:
			bonus.increase.damage = 12 * value;
			g_logger().debug("[{}] Knight_Front_Sweep_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Front Sweep", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Front_Sweep_CriticalExtraDamage:
			bonus.increase.criticalDamage = 8 * value;
			g_logger().debug("[{}] Knight_Front_Sweep_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Front Sweep", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Groundshaker_DamageIncrease:
			bonus.increase.damage = 6.5 * value;
			g_logger().debug("[{}] Knight_Groundshaker_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Groundshaker", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Groundshaker_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Knight_Groundshaker_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Groundshaker", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Annihilation_DamageIncrease:
			bonus.increase.damage = 12 * value;
			g_logger().debug("[{}] Knight_Annihilation_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Annihilation", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_Annihilation_CriticalExtraDamage:
			bonus.increase.criticalDamage = 15 * value;
			g_logger().debug("[{}] Knight_Annihilation_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Annihilation", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_FairWoundCleansing_HealingIncrease:
			bonus.increase.heal = 10 * value;
			g_logger().debug("[{}] Knight_FairWoundCleansing_HealingIncrease: heal +{}% / grade: {}", __FUNCTION__, bonus.increase.heal, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Fair Wound Cleansing", bonus));
			break;
		case WheelGemSupremeModifier_t::Knight_RevelationMastery_AvatarOfSteel:
			g_logger().debug("[{}] Knight_RevelationMastery_AvatarOfSteel: +{} AvatarOfSteel points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Purple, 150 * value));
			break;
		case WheelGemSupremeModifier_t::Knight_RevelationMastery_ExecutionersThrow:
			g_logger().debug("[{}] Knight_RevelationMastery_ExecutionersThrow: +{} ExecutionersThrow: points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Red, 150 * value));
			break;
		case WheelGemSupremeModifier_t::Knight_RevelationMastery_CombatMastery:
			g_logger().debug("[{}] Knight_RevelationMastery_CombatMastery: +{} CombatMastery: points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Blue, 150 * value));
			break;

		case WheelGemSupremeModifier_t::Paladin_AvatarOfLight_Cooldown:
			bonus.decrease.cooldown = 900 * 1000;
			g_logger().debug("[{}] Paladin_AvatarOfLight_Cooldown: decrease cooldown -900s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Avatar of Light", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Paladin_AvatarOfLight_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Paladin_DivineDazzle_Cooldown:
			bonus.decrease.cooldown = 4 * 1000;
			g_logger().debug("[{}] Paladin_DivineDazzle_Cooldown: decrease cooldown -4s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Divine Dazzle", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Paladin_DivineDazzle_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Paladin_DivineGrenade_DamageIncrease:
			bonus.increase.damage = 6 * value;
			g_logger().debug("[{}] Paladin_DivineGrenade_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Divine Grenade", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_DivineGrenade_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Paladin_DivineGrenade_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Divine Grenade", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_DivineCaldera_DamageIncrease:
			bonus.increase.damage = 5 * value;
			g_logger().debug("[{}] Paladin_DivineCaldera_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Divine Caldera", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_DivineCaldera_CriticalExtraDamage:
			bonus.increase.criticalDamage = 8 * value;
			g_logger().debug("[{}] Paladin_DivineCaldera_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Divine Caldera", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_DivineMissile_DamageIncrease:
			bonus.increase.damage = 8 * value;
			g_logger().debug("[{}] Paladin_DivineMissile_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Divine Missile", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_DivineMissile_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Paladin_DivineMissile_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Divine Missile", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_EtherealSpear_DamageIncrease:
			bonus.increase.damage = 10 * value;
			g_logger().debug("[{}] Paladin_EtherealSpear_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Ethereal Spear", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_EtherealSpear_CriticalExtraDamage:
			bonus.increase.criticalDamage = 15 * value;
			g_logger().debug("[{}] Paladin_EtherealSpear_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Ethereal Spear", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_StrongEtherealSpear_DamageIncrease:
			bonus.increase.damage = 8 * value;
			g_logger().debug("[{}] Paladin_StrongEtherealSpear_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Strong Ethereal Spear", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_StrongEtherealSpear_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Paladin_StrongEtherealSpear_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Strong Ethereal Spear", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_DivineEmpowerment_Cooldown:
			bonus.decrease.cooldown = 6 * 1000;
			g_logger().debug("[{}] Paladin_DivineEmpowerment_Cooldown: decrease cooldown -6s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Divine Empowerment", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Paladin_DivineEmpowerment_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Paladin_DivineGrenade_Cooldown:
			bonus.decrease.cooldown = 2 * 1000;
			g_logger().debug("[{}] Paladin_DivineGrenade_Cooldown: decrease cooldown -2s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Divine Grenade", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Paladin_DivineGrenade_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Paladin_Salvation_HealingIncrease:
			bonus.increase.heal = 6 * value;
			g_logger().debug("[{}] Paladin_Salvation_HealingIncrease: heal +{}% / grade: {}", __FUNCTION__, bonus.increase.heal, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Salvation", bonus));
			break;
		case WheelGemSupremeModifier_t::Paladin_RevelationMastery_AvatarOfLight:
			g_logger().debug("[{}] Paladin_RevelationMastery_AvatarOfLight: +{} AvatarOfLight points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Purple, 150 * value));
			break;
		case WheelGemSupremeModifier_t::Paladin_RevelationMastery_DivineGrenade:
			g_logger().debug("[{}] Paladin_RevelationMastery_DivineGrenade: +{} DivineGrenade points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Red, 150 * value));
			break;
		case WheelGemSupremeModifier_t::Paladin_RevelationMastery_DivineEmpowerment:
			g_logger().debug("[{}] Paladin_RevelationMastery_DivineEmpowerment: +{} DivineEmpowerment points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Blue, 150 * value));
			break;

		case WheelGemSupremeModifier_t::Sorcerer_AvatarOfStorm_Cooldown:
			bonus.decrease.cooldown = 900 * 1000;
			g_logger().debug("[{}] Sorcerer_AvatarOfStorm_Cooldown: decrease cooldown -900s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Avatar of Storm", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Sorcerer_AvatarOfStorm_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Sorcerer_EnergyWave_Cooldown:
			bonus.decrease.cooldown = 1 * 1000;
			g_logger().debug("[{}] Sorcerer_EnergyWave_Cooldown: decrease cooldown -1s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Energy Wave", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Sorcerer_EnergyWave_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Sorcerer_GreatDeathBeam_DamageIncrease:
			bonus.increase.damage = 10 * value;
			g_logger().debug("[{}] Sorcerer_GreatDeathBeam_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Great Death Beam", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_GreatDeathBeam_CriticalExtraDamage:
			bonus.increase.criticalDamage = 15 * value;
			g_logger().debug("[{}] Sorcerer_GreatDeathBeam_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Great Death Beam", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_HellsCore_DamageIncrease:
			bonus.increase.damage = 8 * value;
			g_logger().debug("[{}] Sorcerer_HellsCore_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Hell's Core", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_HellsCore_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Sorcerer_HellsCore_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Hell's Core", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_EnergyWave_DamageIncrease:
			bonus.increase.damage = 5 * value;
			g_logger().debug("[{}] Sorcerer_EnergyWave_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Energy Wave", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_EnergyWave_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Sorcerer_EnergyWave_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Energy Wave", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_GreatFireWave_DamageIncrease:
			bonus.increase.damage = 5 * value;
			g_logger().debug("[{}] Sorcerer_GreatFireWave_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Great Fire Wave", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_GreatFireWave_CriticalExtraDamage:
			bonus.increase.criticalDamage = 8 * value;
			g_logger().debug("[{}] Sorcerer_GreatFireWave_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Great Fire Wave", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_RageOfTheSkies_DamageIncrease:
			bonus.increase.damage = 8 * value;
			g_logger().debug("[{}] Sorcerer_RageOfTheSkies_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Rage of the Skies", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_RageOfTheSkies_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Sorcerer_RageOfTheSkies_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Rage of the Skies", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_GreatEnergyBeam_DamageIncrease:
			bonus.increase.damage = 10 * value;
			g_logger().debug("[{}] Sorcerer_GreatEnergyBeam_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Great Energy Beam", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_GreatEnergyBeam_CriticalExtraDamage:
			bonus.increase.criticalDamage = 15 * value;
			g_logger().debug("[{}] Sorcerer_GreatEnergyBeam_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Great Energy Beam", bonus));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_RevelationMastery_AvatarOfStorm:
			g_logger().debug("[{}] Sorcerer_RevelationMastery_AvatarOfStorm: +{} AvatarOfStorm points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Purple, 150 * value));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_RevelationMastery_BeamMastery:
			g_logger().debug("[{}] Sorcerer_RevelationMastery_BeamMastery: +{} BeamMastery points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Red, 150 * value));
			break;
		case WheelGemSupremeModifier_t::Sorcerer_RevelationMastery_DrainBody:
			g_logger().debug("[{}] Sorcerer_RevelationMastery_DrainBody: +{} DrainBody points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Blue, 150 * value));
			break;

		case WheelGemSupremeModifier_t::Druid_AvatarOfNature_Cooldown:
			bonus.decrease.cooldown = 900 * 1000;
			g_logger().debug("[{}] Druid_AvatarOfNature_Cooldown: decrease cooldown -900s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Avatar of Nature", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Druid_AvatarOfNature_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Druid_NaturesEmbrace_Cooldown:
			bonus.decrease.cooldown = 10 * 1000;
			g_logger().debug("[{}] Druid_NaturesEmbrace_Cooldown: decrease cooldown -10s", __FUNCTION__);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Nature's Embrace", bonus));
			if (grade > 0) {
				uint8_t momentum = 33 * grade;
				if (grade >= 3) {
					momentum = 100;
				}
				g_logger().debug("[{}] Druid_NaturesEmbrace_Cooldown: momentum +{}% / grade: {}", __FUNCTION__, momentum / 100, grade);
				m_strategies.push_back(std::make_unique<GemModifierStatStrategy>(m_wheel, WheelStat_t::MOMENTUM, momentum));
			}
			break;
		case WheelGemSupremeModifier_t::Druid_TerraBurst_DamageIncrease:
			bonus.increase.damage = 7 * value;
			g_logger().debug("[{}] Druid_TerraBurst_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Terra Burst", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_TerraBurst_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Druid_TerraBurst_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Terra Burst", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_IceBurst_DamageIncrease:
			bonus.increase.damage = 7 * value;
			g_logger().debug("[{}] Druid_IceBurst_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Ice Burst", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_IceBurst_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Druid_IceBurst_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Ice Burst", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_EternalWinter_DamageIncrease:
			bonus.increase.damage = 8 * value;
			g_logger().debug("[{}] Druid_EternalWinter_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Eternal Winter", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_EternalWinter_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Druid_EternalWinter_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Eternal Winter", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_TerraWave_DamageIncrease:
			bonus.increase.damage = 5 * value;
			g_logger().debug("[{}] Druid_TerraWave_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Terra Wave", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_TerraWave_CriticalExtraDamage:
			bonus.increase.criticalDamage = 12 * value;
			g_logger().debug("[{}] Druid_TerraWave_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Terra Wave", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_StrongIceWave_DamageIncrease:
			bonus.increase.damage = 8 * value;
			g_logger().debug("[{}] Druid_StrongIceWave_DamageIncrease: base damage +{}% / grade: {}", __FUNCTION__, bonus.increase.damage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Strong Ice Wave", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_StrongIceWave_CriticalExtraDamage:
			bonus.increase.criticalDamage = 15 * value;
			g_logger().debug("[{}] Druid_StrongIceWave_CriticalExtraDamage: critical damage +{}% / grade: {}", __FUNCTION__, bonus.increase.criticalDamage, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Strong Ice Wave", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_HealFriend_HealingIncrease:
			bonus.increase.heal = 5 * value;
			g_logger().debug("[{}] Druid_HealFriend_HealingIncrease: heal +{}% / grade: {}", __FUNCTION__, bonus.increase.heal, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Heal Friend", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_MassHealing_HealingIncrease:
			bonus.increase.heal = 5 * value;
			g_logger().debug("[{}] Druid_MassHealing_HealingIncrease: heal +{}% / grade: {}", __FUNCTION__, bonus.increase.heal, grade);
			m_strategies.push_back(std::make_unique<GemModifierSpellBonusStrategy>(m_wheel, "Mass Healing", bonus));
			break;
		case WheelGemSupremeModifier_t::Druid_RevelationMastery_AvatarOfNature:
			g_logger().debug("[{}] Druid_RevelationMastery_AvatarOfNature: +{} AvatarOfNature points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Purple, 150 * value));
			break;
		case WheelGemSupremeModifier_t::Druid_RevelationMastery_BlessingOfTheGrove:
			g_logger().debug("[{}] Druid_RevelationMastery_BlessingOfTheGrove: +{} BlessingOfTheGrove points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Red, 150 * value));
			break;
		case WheelGemSupremeModifier_t::Druid_RevelationMastery_TwinBursts:
			g_logger().debug("[{}] Druid_RevelationMastery_BlessingOfTheGrove: +{} TwinBursts points / grade: {}", __FUNCTION__, 150 * value, grade);
			m_strategies.push_back(std::make_unique<GemModifierRevelationStrategy>(m_wheel, WheelGemAffinity_t::Blue, 150 * value));
			break;

		default:
			g_logger().error("WheelModifierContext::setStrategy: Invalid supreme modifier: {}", static_cast<uint8_t>(modifier));
	}
}

void WheelModifierContext::executeStrategies() {
	for (auto &strategy : m_strategies) {
		strategy->execute();
	}
}

/*
 * Author: Dextro
 * Handling Poison Level Effects
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Poison Level <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, 25] call ACE_medical_fnc_handlePoison
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_level"];


if ([_unit, _level] call ACE_medical_fnc_updatePoisonStage) then {
	switch (_unit getVariable [QGVAR(poisonStage), 0]) do {
		case 1: {
			"dynamicBlur" ppEffectEnable true; // enables ppeffect
			"dynamicBlur" ppEffectAdjust [0.5]; // intensity of blur
			"dynamicBlur" ppEffectCommit 10; // time till vision is fully blurred
		};
		case 2: {
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 10;
			[_unit, 0.2] call FUNC(adjustPainLevel);
		};
		case 3: {
			[_unit, 0.2] call FUNC(adjustPainLevel);
		};
		case 4: {
			[_unit, 0.25, "body", "stab"] call ace_medical_fnc_addDamageToUnit;
			[_unit, 0.25, "head", "stab"] call ace_medical_fnc_addDamageToUnit;
		};
		case 5: {
			[_unit, 0.5, "body", "stab"] call ace_medical_fnc_addDamageToUnit;
			[_unit, 0.5, "head", "stab"] call ace_medical_fnc_addDamageToUnit;
		};
		default {
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [0];
			"dynamicBlur" ppEffectCommit 10;
		};
	};
};


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

_old = _unit getVariable [QGVAR(poisonStage), 0];
if ([_unit, _level] call FUNC(updatePoisonStage) != _old) then {
	switch (_unit getVariable [QGVAR(poisonStage), 0]) do {
		case 1: {
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) = ppEffectCreate ["DynamicBlur", 102];
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectAdjust [0.5];
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectEnable true;
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectCommit 10;
		};
		case 2: {
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectAdjust [2];
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectEnable true;
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectCommit 10;
			[_unit, 0.2] call FUNC(adjustPainLevel);
		};
		case 3: {
			[_unit, 0.2] call FUNC(adjustPainLevel);
		};
		case 4: {
			[_unit, 0.25, "body", "stab"] call FUNC(addDamageToUnit);
			[_unit, 0.25, "head", "stab"] call FUNC(addDamageToUnit);
		};
		case 5: {
			[_unit, 0.5, "body", "stab"] call FUNC(addDamageToUnit);
			[_unit, 0.5, "head", "stab"] call FUNC(addDamageToUnit);
		};
		default {
            ppEffectDestroy GVAR(Poison_ppHandle_GUI_BLUR_SCREEN);
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) = nil;
		};
	};
};


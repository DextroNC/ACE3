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

// Saves current Poison Stage
private _old = _unit getVariable [QGVAR(poisonStage), 0];
// Gets new Poison Stage
private _new = [_unit, _level] call FUNC(updatePoisonStage);

// checks new poison level and updates effects on change
if (_new != _old) then {
	// Updates Poison Stage
	_unit setVariable [QGVAR(poisonStage),_new,true];
	// Updates Poison Effect
	switch (_new) do {
		// Stage 1
		case 1: {
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) = ppEffectCreate ["DynamicBlur", 102];
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectAdjust [0.3];
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectEnable true;
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectCommit 15;
		};
		// Stage 2
		case 2: {
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectAdjust [1];
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectEnable true;
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectCommit 10;
			[_unit, 0.1] call FUNC(adjustPainLevel);
		};
		// Stage 3
		case 3: {
			[_unit, 0.2] call FUNC(adjustPainLevel);
		};
		// Stage 4
		case 4: {
			[_unit, 0.3] call FUNC(adjustPainLevel);
			[_unit, 0.25, "body", "stab"] call FUNC(addDamageToUnit);
			[_unit, 0.25, "head", "stab"] call FUNC(addDamageToUnit);
		};
		// Stage 5
		case 5: {
			[_unit, 0.25, "body", "stab"] call FUNC(addDamageToUnit);
			[_unit, 0.25, "head", "stab"] call FUNC(addDamageToUnit);
		};
		// Stage 6
		case 6: {
			[_unit, 0.25, "body", "stab"] call FUNC(addDamageToUnit);
			[_unit, 0.25, "head", "stab"] call FUNC(addDamageToUnit);
		};
		// Stage 7
		case 7: {
			[_unit, 0.6, "body", "stab"] call FUNC(addDamageToUnit);
			[_unit, 0.6, "head", "stab"] call FUNC(addDamageToUnit);
		};
		// Stage 0 - remove temporary effects
		case 0: {
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectAdjust [0];
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectEnable true;
			GVAR(Poison_ppHandle_GUI_BLUR_SCREEN) ppEffectCommit 5;
            ppEffectDestroy GVAR(Poison_ppHandle_GUI_BLUR_SCREEN);
		};
	};
};


/*
 * Author: Glowbal
 * Check if unit is able to check if present in contaminated Area
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can Check <BOOL>
 *
 * Example:
 * [player] call ace_medical_fnc_canCheckPoison
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];

if (GVAR(poisonDetection)== 0) exitWith {true};
if (GVAR(poisonDetection)== 2) exitWith {false};
if (GVAR(poisonDetection)== 1) exitWith {
	if ([_unit] call EFUNC(medical,isMedic)) then {true} else {false};
};


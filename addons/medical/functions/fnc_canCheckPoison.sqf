/*
 * Author: Glowbal
 * Check if the treatment action can be performed.
 *
 * Arguments:
 * 0: The caller <OBJECT>
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

params ["_caller"];

if (GVAR(poisonDetection)== 0) exitWith {true};
if (GVAR(poisonDetection)== 2) exitWith {false};
if (GVAR(poisonDetection)== 1) exitWith {
	if ([_caller] call EFUNC(medical,isMedic)) then {true} else {false};
};


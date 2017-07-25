/*
 * Author: Dextro
 * Poison Area Trigger Condition. Checks if unit is in contaminated area and not wearing Protection.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Trigger <OBJECT>
 *
 * Return Value:
 * Can get Poisoned <BOOLEAN>
 *
 * Example:
 * [player,thisTrigger] call ace_medical_fnc_poisonCondition as Trigger Condition of Poison Zone Trigger
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit","_trigger"];

// Player in Area and Unprotected
if ((_unit inArea _trigger) && !(goggles _unit isEqualTo GVAR(gasMask))) then {
	true
} else {
	false
};
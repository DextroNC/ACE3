#include "script_component.hpp"
/*
* Author: Dextro
* Check if unit is platoon sergeant
*
* Arguments:
* 1: Unit <OBJECT>
*
* Return Value:
* is Sergeant <BOOL>
*
* Example:
* [player] call ace_map_fnc_isSergeant
*
*/

// Parameter Init
params ["_unit"];
private _return = false;

// Check Condition
if ((groupId group _unit) in ["PL","PL-1","PL-2"]) then {
	if ((rank _unit) isEqualTo "SERGEANT") then {
		_return = true;
	};
};

// Return
_return
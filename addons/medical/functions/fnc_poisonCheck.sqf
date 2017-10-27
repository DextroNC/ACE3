/*
 * Author: Dextro
 * Check if the if Area is Contaminated.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can Check <BOOL>
 *
 * Example:
 * [player] call ace_medical_fnc_poisonCheck
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];

// Animation
[_unit, "AmovPknlMstpSrasWrflDnon_gear_AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);

[3, [_unit], {
	// Parameter init progressBar
	_unit = (_this select 0) select 0;
	
	// unit in contaminated area check
	if (_unit getVariable [QGVAR(contaminatedArea),false]) then {
		["Area Contaminated"] call EFUNC(common,displayTextStructured);
	} else {
		["Area Safe"] call EFUNC(common,displayTextStructured);
	};
},{hint "Action Canceled"}, "Checking Environment..."] call EFUNC(common,progressBar);

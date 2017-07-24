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
 * [player] call ace_medical_fnc_checkPoison
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];

[3, [_unit], {
_unit = (_this select 0) select 0;
if (_unit getVariable [QGVAR(contaminated),false]) then {
	["Area Contaminated"] call EFUNC(common,displayTextStructured);
} else {
	["Area Safe"] call EFUNC(common,displayTextStructured);
};
},{hint "Action Canceled"}, "Checking Environment..."] call EFUNC(common,progressBar);
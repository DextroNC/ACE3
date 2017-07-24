/*
 * Author: Dextro
 * Poison activation / loop
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Trigger <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [player] call ace_medical_fnc_poison
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit","_trigger"];

[{
_args = _this select 0;
_args params ["_unit","_trigger"];
if ([_unit,_trigger]call FUNC(protectionCheck)) then {
	[_this select 1] call CBA_fnc_removePerFrameHandler;
} else {
	_old = _unit getVariable [QGVAR(poison),0];
	_new = _old + 1;
	_unit setVariable [QGVAR(poison),_new, true];
};
}, 1] call CBA_fnc_addPerFrameHandler;
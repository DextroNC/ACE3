/*
 * Author: Dextro
 * Updating the Poison Stage
 *
 * Arguments:
 * 0: Unit affected by Poison <OBJECT>
 * 1: Poison Level <NUMBER>
 *
 * Return Value:
 * New Stage reached
 *
 * Example:
 * [bob, 25] call ACE_medical_fnc_updatePoisonStage
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit","_level"];


private _stageCurrent = _unit getVariable [QGVAR(poisonStage), 0];
private _stageNew;
private _return = false;

if (_level == 0) then {
	_stageNew = 0;
};
if (_level > 10) then {
	_stageNew = 1;
};
if (_level > 25) then {
	_stageNew = 2;
};
if (_level > 50) then {
	_stageNew = 3;
};
if (_level > 75) then {
	_stageNew = 4;
};
if (_level > 100) then {
	_stageNew = 5;
};

if (_stageCurrent != _stageNew) then {
	_unit setVariable [QGVAR(poisonStage), _stageNew, true];
	_return = true;
};

_return


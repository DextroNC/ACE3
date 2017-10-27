/*
 * Author: Dextro
 * Updating the Poison Stage
 *
 * Arguments:
 * 0: Unit affected by Poison <OBJECT>
 * 1: Poison Level <NUMBER>
 *
 * Return Value:
 * Poison Stage
 *
 * Example:
 * [bob, 25] call ACE_medical_fnc_updatePoisonStage
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit","_level"];
private _stage = 0;

if (_level == 0) then {
	_stage = 0;
};
if (_level > 0) then {
	_stage = 1;
};
if (_level >= 20) then {
	_stage = 2;
};
if (_level >= 30) then {
	_stage = 3;
};
if (_level >= 40) then {
	_stage = 4;
};
if (_level >= 60) then {
	_stage = 5;
};
if (_level >= 70) then {
	_stage = 6;
};
if (_level >= 90) then {
	_stage = 7;
};

_stage


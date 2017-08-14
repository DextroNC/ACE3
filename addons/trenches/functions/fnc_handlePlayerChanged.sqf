/*
 * Author: commy2
 * Handle player changes.
 *
 * Arguments:
 * 0: New Player Unit <OBJECT>
 * 1: Old Player Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_newPlayer", "_oldPlayer"];

if (_newPlayer getVariable [QGVAR(isPlacing), false]) then {
    [_newPlayer] call FUNC(placeCancel);
};

if (_oldPlayer getVariable [QGVAR(isPlacing), false]) then {
    [_oldPlayer] call FUNC(placeCancel);
};

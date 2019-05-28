#include "script_component.hpp"
/*
 * Author: commy2
 * Handle opening of interaction menu.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_unit"];

if (_unit getVariable [QGVAR(isPlacing), false]) then {
    [_unit] call FUNC(placeCancel);
};

/*
 * Author: Ruthberg, commy2, esteldunedain
 * Checks if a unit can dig a trench
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Cost <Integer>
 *
 * Return Value:
 * Can dig <BOOL>
 *
 * Example:
 * [ACE_player,5] call ace_trenches_fnc_canConstruct
 *
 * Public: No
 */
#include "script_component.hpp"


params ["_unit","_cost"];

if !("ACE_EntrenchingTool" in items _unit) exitWith {false};
if !("ACE_ConstructionTool" in items _unit) exitWith {false};
private _remain = GVAR(trenchSupplies) - _cost;
if (_remain >= 0) then {true} else {false};

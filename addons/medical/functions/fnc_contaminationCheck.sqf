/*
 * Author: Dextro
 * Checks if somebody can be contaminated
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Trigger <OBJECT>
 *
 * Return Value:
 * Can be contaminated <BOOL>
 *
 * Example:
 * [player] call ace_medical_fnc_contaminationCheck
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit","_trigger"];

if ([_unit,_trigger] call CBA_fnc_inArea && (![player] call FUNC(protectionCheck))) then {true} else {false};
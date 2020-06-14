#include "script_component.hpp"
/*
 * Author: Dextro
 * Checks if a unit is in a designated decon area
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Is in medical facility <BOOL>
 *
 * Example:
 * [player] call ace_medical_fnc_inDeconArea
 *
 * Public: Yes
 */

params ["_unit"];

//Cache the results as this function could be called rapidly
(_unit getVariable [QGVAR(cacheInFacility), [-9, false]]) params ["_expireTime", "_lastResult"];
if (CBA_missionTime < _expireTime) exitWith {_lastResult};

private _isInBuilding = false;

/*if ({!(_x getVariable ['bin_deconshower_disableAction',false]) && _x animationSourcePhase 'valve_source' > 0} count (_unit nearObjects ['ACE_DeconStation',1.7]) > 0) then {
    _isInBuilding = true;
};*/
if (count (_unit nearObjects ['ACE_DeconStation',1.7]) > 0) then {
    _isInBuilding = true;
};

_unit setVariable [QGVAR(cacheInFacility), [CBA_missionTime + 1, _isInBuilding]];

_isInBuilding;
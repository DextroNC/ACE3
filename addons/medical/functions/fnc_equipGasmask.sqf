/*
 * Author: Dextro
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, patient, "bandage"] call ace_medical_fnc_equipGasmask
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];

[3, [_unit], {
_unit = (_this select 0) select 0;
_old = goggles _unit;
_unit setVariable ["oldGoggles",_old];
removeGoggles _unit;
_unit addGoggles GVAR(gasMask);
_unit setUnitTrait ["loadCoef",0.75];
[{
if (!(goggles player isEqualTo GVAR(gasMask))) then {
	[_this select 1] call CBA_fnc_removePerFrameHandler;
} else {player action ["nvGogglesOff", player];};
}, 0.5] call CBA_fnc_addPerFrameHandler;
},{hint "Action Canceled"}, "Equiping Gasmask..."] call EFUNC(common,progressBar);;

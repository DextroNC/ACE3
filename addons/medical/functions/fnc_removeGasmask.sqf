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
removeGoggles _unit;
_unit addGoggles (_unit getVariable "oldGoggles");
_unit setUnitTrait ["loadCoef",1];
},{hint "Action Canceled"}, "Equiping Gasmask..."] call EFUNC(common,progressBar);

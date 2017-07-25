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
 * [player] call ace_medical_fnc_removeGasmask
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];

// Animation
[_unit, "AmovPknlMstpSrasWrflDnon_gear_AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);

[3, [_unit], {
	// Parameter Init progressBar
	_unit = (_this select 0) select 0;
	
	// remove Gasmask and update Protection Var
	removeGoggles _unit;
	_unit setVariable [QGVAR(poisonProtection),false,true];
	
	// Equip initial goggles
	_unit addGoggles (_unit getVariable QGVAR(oldGoggles));
	
	// remove negativ effects of Gasmask
	_unit setUnitTrait ["loadCoef",1];
	
},{hint "Action Canceled"}, "Equiping Gasmask..."] call EFUNC(common,progressBar);

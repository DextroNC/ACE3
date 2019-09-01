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
//[_unit, "AmovPknlMstpSrasWrflDnon_gear_AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);

[5, [_unit], {
	// Parameter Init progressBar
	_unit = (_this select 0) select 0;
	
	[_unit, _unit] call ACE_medical_fnc_treatmentBasic_atropine;

},{hint "Action Canceled"}, "Decontaminating..."] call EFUNC(common,progressBar);

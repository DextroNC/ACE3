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
 * [player] call ace_medical_fnc_equipGasmask
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
	
	// Save and Remove old Goggles
	_old = goggles _unit;
	_unit setVariable [QGVAR(oldGoggles),_old,true];
	removeGoggles _unit;
	
	// Set Protection Variable
	_unit setVariable [QGVAR(poisonProtection),true,true];
	
	// Add Gasmask as Goggles
	_unit addGoggles GVAR(gasMask);
	
	// Adds Atropine if unit carrying Poison Kit and has not opened it already
	if (GVAR(poisonKit) && (_unit getVariable [QGVAR(poisonKitClosed),true])) then {
		_unit addItem "ACE_atropine";
		_unit setVariable [QGVAR(poisonKitClosed),false,true];
	};
	
	// Set Gasmask player limitations
	_unit setUnitTrait ["loadCoef",0.65];

	// disable NVG when wearing Gasmask perFrameEventHandler
	[{
		// Parameter Init perFrameEventHandler
		params ["_args", "_idPFH"];
		_args params ["_unit"];
		
		// Disables NVG
		_unit action ["nvGogglesOff", _unit];
		
		// Removes Handler when Gasmask is off or Unit is dead
		if (!(goggles _unit isEqualto GVAR(gasMask)) || !(alive _unit)) then {
			[_idPFH] call CBA_fnc_removePerFrameHandler;
		};
	}, 0.1,[_unit]] call CBA_fnc_addPerFrameHandler;
	
},{hint "Action Canceled"}, "Equiping Gasmask..."] call EFUNC(common,progressBar);
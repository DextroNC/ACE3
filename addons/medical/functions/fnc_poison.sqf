/*
 * Author: Dextro
 * Poison activation / loop
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Trigger <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [player,thisTrigger] call ace_medical_fnc_poison as Poison Zone Trigger onActivation
 *
 * Public: Yes
 */

#include "script_component.hpp"

// Parameter Init
params ["_unit","_trigger"];

// Start Vital Loop (if it has not already)
[_unit] call FUNC(addVitalLoop);

[{
	// Parameter Init perFrameHandler
	params ["_args", "_idPFH"];
	_args params ["_unit","_trigger"];
	
	// Check if unit still in Zone
	if (_unit inArea _trigger) then
		{
			// Variable to Point presence in Contamintad Area
			_unit setVariable [QGVAR(contaminatedArea),true,true];
			// Check if unit is unprotected and concious
			if (!(_unit getVariable [QGVAR(poisonProtection),false]) && !(_unit getVariable ["ACE_isUnconscious", false])) then {
				// increases Poison Level
				_old = _unit getVariable [QGVAR(poisonLevel),0];
				_new = _old + 1;
				_unit setVariable [QGVAR(poisonLevel),_new, true];
			};
		} else {
			// Unit left Poison Zone, clean up
			_unit setVariable [QGVAR(contaminatedArea),false,true];
			[_idPFH] call CBA_fnc_removePerFrameHandler;
		};
}, 1, [_unit,_trigger]] call CBA_fnc_addPerFrameHandler;
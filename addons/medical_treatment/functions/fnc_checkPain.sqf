#include "script_component.hpp"
/*
 * Author: Glowbal
 * Checks the pain status of the patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_checkPain
 *
 * Public: No
 */

params ["_medic", "_patient"];
private _output = "";

// Check Pain
if (GET_PAIN_PERCEIVED(_patient) > 0) then {
	if (IN_CRDC_ARRST(_patient)) then {
		_output = "%1 is not responsive";
	} else {
		_output = "%1 is in pain";
	};
} else {
	_output = "%1 is not in pain";
};

[[_output, _patient call EFUNC(common,getName)], 2] call EFUNC(common,displayTextStructured);
[_patient, "quick_view", _output, [[_patient, false, true] call EFUNC(common,getName)]] call FUNC(addToLog);

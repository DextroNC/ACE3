/*
 * Author: KoffeinFlummi
 * Local callback when the morphine treatment is complete
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin] call ACE_medical_fnc_treatmentBasic_atropineLocal
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_medic","_target"];

// Sets Poison Level and Stage to 0
_target setVariable [QGVAR(poisonLevel),0,true];

// Calls handlePoison to update effects
[_target, 0] call FUNC(handlePoison);
/*
 * Author: KoffeinFlummi
 * Callback when the morphine treatment is complete
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin] call ACE_medical_fnc_treatmentBasic_atropine
 *
 * Public: No
 */

#include "script_component.hpp"
#define MORPHINEHEAL 0.4

params ["_caller", "_target"];

if (local _target) then {
    [QGVAR(treatmentBasic_atropineLocal), [_target]] call CBA_fnc_localEvent;
} else {
    [QGVAR(treatmentBasic_atropineLocal), [_target], _target] call CBA_fnc_targetEvent;
};

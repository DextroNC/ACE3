/*
 * Author: Dextro
 * Checks if player is protected
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Player Protected <BOOL>
 *
 * Example:
 * [player] call ace_medical_fnc_protectionCheck
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];

if ((goggles _unit isEqualTo GVAR(gasMask))) then {true} else {false};
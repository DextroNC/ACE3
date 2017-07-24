/*
 * Author: KoffeinFlummi
 * Replaces vanilla items with ACE ones.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_medical_fnc_itemCheck
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit"];

while {({_x == "FirstAidKit"} count items _unit) > 0} do {
    _unit removeItem "FirstAidKit";
    if (GVAR(level) >= 2) then {
        _unit addItem "ACE_fieldDressing";
        _unit addItem "ACE_packingBandage";
        _unit addItem "ACE_morphine";
        _unit addItem "ACE_tourniquet";
    } else {
        _unit addItem "ACE_fieldDressing";
        _unit addItem "ACE_fieldDressing";
        _unit addItem "ACE_morphine";
    };
};

while {({_x == "SR_PAK"} count items _unit) > 0} do {
    _unit removeItem "SR_PAK";
	_unit addItem "ACE_fieldDressing";
	_unit addItem "ACE_fieldDressing";
	_unit addItem "ACE_fieldDressing";
	_unit addItem "ACE_fieldDressing";
	_unit addItem "ACE_fieldDressing";
	_unit addItem "ACE_morphine";
	_unit addItem "ACE_morphine";
	_unit addItem "ACE_fieldDressing";
	_unit addItem "ACE_fieldDressing";
	_unit addItem "ACE_fieldDressing";
	_unit addItem "ACE_fieldDressing";
	_unit addItem "ACE_fieldDressing";
};

while {({_x == "Medikit"} count items _unit) > 0} do {
    _unit removeItem "Medikit";
    if (GVAR(level) >= 2) then {
        _unit addItemToBackpack "ACE_fieldDressing";
        _unit addItemToBackpack "ACE_packingBandage";
        _unit addItemToBackpack "ACE_packingBandage";
        _unit addItemToBackpack "ACE_epinephrine";
        _unit addItemToBackpack "ACE_morphine";
        _unit addItemToBackpack "ACE_salineIV_250";
        _unit addItemToBackpack "ACE_tourniquet";
    } else {
        _unit addItemToBackpack "ACE_epinephrine";
        _unit addItemToBackpack "ACE_epinephrine";
        _unit addItemToBackpack "ACE_epinephrine";
        _unit addItemToBackpack "ACE_epinephrine";
        _unit addItemToBackpack "ACE_bloodIV";
        _unit addItemToBackpack "ACE_bloodIV";
    };
};

while {({_x == "SR_MAK"} count items _unit) > 0} do {
	if (_unit getVariable ["ace_medical_medicClass", 0] == 0) exitWith {};
	_unit removeItem "SR_MAK";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_epinephrine";
	_unit addItemToBackpack "ACE_epinephrine";
	_unit addItemToBackpack "ACE_epinephrine";
	_unit addItemToBackpack "ACE_bloodIV_500";
	_unit addItemToBackpack "ACE_bloodIV_500";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_epinephrine";
	_unit addItemToBackpack "ACE_epinephrine";
	_unit addItemToBackpack "ACE_bloodIV";
	_unit addItemToBackpack "ACE_bloodIV_500";	
};

while {({_x == "SR_Bandage_Pack"} count items _unit) > 0} do {
	if (_unit getVariable ["ace_medical_medicClass", 0] == 0) exitWith {};
	_unit removeItem "SR_Bandage_Pack";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
	_unit addItemToBackpack "ACE_fieldDressing";
};

while {({_x == "SR_Medicine_Pack"} count items _unit) > 0} do {
	if (_unit getVariable ["ace_medical_medicClass", 0] == 0) exitWith {};
	_unit removeItem "SR_Medicine_Pack";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_epinephrine";
	_unit addItemToBackpack "ACE_epinephrine";
	_unit addItemToBackpack "ACE_epinephrine";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_morphine";
	_unit addItemToBackpack "ACE_epinephrine";
	_unit addItemToBackpack "ACE_epinephrine";
};

while {({_x == "SR_BloodIV_Pack"} count items _unit) > 0} do {
	if (_unit getVariable ["ace_medical_medicClass", 0] == 0) exitWith {};
	_unit removeItem "SR_BloodIV_Pack";
	_unit addItemToBackpack "ACE_bloodIV_500";
	_unit addItemToBackpack "ACE_bloodIV";
	_unit addItemToBackpack "ACE_bloodIV_500";
};


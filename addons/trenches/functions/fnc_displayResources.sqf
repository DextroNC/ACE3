/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support, esteldunedain
 * Diplays Resources available
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_trenches_fnc_displayResources
 *
 * Public: No
 */
#include "script_component.hpp"

hint format ["%1 Resources available", QGVAR(trenchSupplies)];


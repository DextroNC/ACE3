#include "script_component.hpp"
/*
 * Author: ACE-Team
 * Update the blue force tracking.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_map_fnc_blueForceTrackingUpdate
 *
 * Public: No
 */

// BEGIN_COUNTER(blueForceTrackingUpdate);

// Delete last set of markers (always)
{
    deleteMarkerLocal _x;
} forEach GVAR(BFT_markers);

GVAR(BFT_markers) = [];

if (GVAR(BFT_Enabled) and {(!isNil "ACE_player") and {alive ACE_player}}) then {
	private _groupsToDrawMarkers = [];
	private _playerSide = call EFUNC(common,playerSide);

	_groupsToDrawMarkers = allGroups select {side _x == _playerSide};

	if (GVAR(BFT_HideAiGroups)) then {
		_groupsToDrawMarkers = _groupsToDrawMarkers select {
			{
				_x call EFUNC(common,isPlayer);
			} count units _x > 0;
		};
	};

	if (GVAR(BFT_ShowPlayerNames)) then {
		private _playersToDrawMarkers = allPlayers select {side _x == _playerSide && {!(_x getVariable [QGVAR(hideBlueForceMarker), false])}};

		{
			private _markerType = [_x] call EFUNC(common,getMarkerType);
			private _colour = format ["Color%1", side _x];

			private _marker = createMarkerLocal [format ["ACE_BFT_%1", _forEachIndex], [(getPos _x) select 0, (getPos _x) select 1]];
			_marker setMarkerTypeLocal _markerType;
			_marker setMarkerColorLocal _colour;
			_marker setMarkerTextLocal (name _x);

			GVAR(BFT_markers) pushBack _marker;
		} forEach _playersToDrawMarkers;

		_groupsToDrawMarkers = _groupsToDrawMarkers select {
			{
				!(_x call EFUNC(common,isPlayer));
			} count units _x > 0;
		};
	};

	_groupsToDrawMarkers = _groupsToDrawMarkers select {!(_x getVariable [QGVAR(hideBlueForceMarker), false])};

	{
		private "_markerDetail";
		_markerDetail = switch (groupId _x) do {
			case "HQ": {["SevenR_HQ","SRColorGold",false]};
			case "PL": {["SevenR_PLo","SRColorGold",false]};
			case "PL-1": {["SevenR_PLo","SRColorGold",false]};
			case "PL-2": {["SevenR_PLt","SRColorGold",false]};
			case "A": {["SevenR_Ao","SRColorGreen",false]};
			case "A-1": {["SevenR_Ao","SRColorGreen",false]};
			case "A-2": {["SevenR_At","SRColorGreen",false]};
			case "B": {["SevenR_Bo","SRColorBrown",false]};
			case "B-1": {["SevenR_Bo","SRColorBrown",false]};
			case "B-2": {["SevenR_Bt","SRColorBrown",false]};				
			case "C": {["SevenR_Co","SRColorPurple",false]};
			case "C-1": {["SevenR_Co","SRColorPurple",false]};
			case "C-2": {["SevenR_Ct","SRColorPurple",false]};
			case "D": {["SevenR_Do","SRColorBlack",false]};
			case "D-1": {["SevenR_Do","SRColorBlack",false]};
			case "D-2": {["SevenR_Dt","SRColorBlack",false]};			
			case "S": {["SevenR_So","SRColorBlue",false]};
			case "S-1": {["SevenR_So","SRColorBlue",false]};
			case "S-2": {["SevenR_St","SRColorBlue",false]};		
			case "R": {["SevenR_Ro","SRColorBlue",false]};
			case "R-1": {["SevenR_Ro","SRColorBlue",false]};
			case "R-2": {["SevenR_Rt","SRColorBlue",false]};
			case "R-3": {["SevenR_Rtr","SRColorBlue",false]};	
			case "R-4": {["SevenR_Rf","SRColorBlue",false]};	
			case "RPR-1": {["SevenR_Rf","SRColorRed",false]};	
			case "RPR-2": {["SevenR_Rf","SRColorRed",false]};	
			case "RPR-3": {["SevenR_Rf","SRColorRed",false]};	
			case "RPR-4": {["SevenR_Rf","SRColorRed",false]};	
			case "F": {["SevenR_Fo","SRColorBlue",false]};
			case "F-1": {["SevenR_Fo","SRColorBlue",false]};
			case "F-2": {["SevenR_Ft","SRColorBlue",false]};		
			case "E": {["SevenR_Eo","SRColorBlue",false]};
			case "E-1": {["SevenR_Eo","SRColorBlue",false]};
			case "E-2": {["SevenR_Et","SRColorBlue",false]};	
			case "L": {["SevenR_Lo","SRColorBlue",false]};	
			case "L-1": {["SevenR_Lo","SRColorBlue",false]};	
			case "L-2": {["SevenR_Lt","SRColorBlue",false]};	
			case "H-1": {["SevenR_Ho","SRColorBlue",false]};	
			case "H-2": {["SevenR_Ht","SRColorBlue",false]};	
			case "H-3": {["SevenR_Htr","SRColorBlue",false]};	
			case "H-4": {["SevenR_Hf","SRColorBlue",false]};	
			case "W-1": {["SevenR_Wo","SRColorBlue",false]};	
			case "W-2": {["SevenR_Wt","SRColorBlue",false]};	
			case "W-3": {["SevenR_Wtr","SRColorBlue",false]};	
			case "W-4": {["SevenR_Wf","SRColorBlue",false]};	
			default {[[_x] call EFUNC(common,getMarkerType),"SRColorBlue",true]}; 
		};
		//if (count _markerDetail < 2) throw "Error BFT Marker Detail";

		// SGT Marker
		{
			if ([_x] call FUNC(isSergeant)) then {
				private _sgtm = createMarkerLocal [format ["ACE_BFT_SGT_%1", _forEachIndex],[(getPos _x) select 0, (getPos _x) select 1]];
				_sgtm setMarkerTypeLocal "SevenR_FTL";
				_sgtm setMarkerColorLocal "ColorWhite";
				_sgtm setMarkerTextLocal "SGT";
				GVAR(BFT_markers) pushBack _sgtm;
			};
		}forEach units _x;
	
		
		private _marker = createMarkerLocal [format ["ACE_BFT_%1", _forEachIndex], [(getPos leader _x) select 0, (getPos leader _x) select 1]];
		_marker setMarkerTypeLocal (_markerDetail select 0);
		_marker setMarkerColorLocal (_markerDetail select 1);
		if (_markerDetail select 2) then {
			_marker setMarkerTextLocal (groupId _x);
		};
		GVAR(BFT_markers) pushBack _marker;
	} forEach _groupsToDrawMarkers;
	
	// Check if more than 3 per Squad
	_units = units group ACE_player;
	if (count _units > 3) then {
		{
			// Check if FTL and select Marker Details
			_markerDetail = [];
			switch (_x getVariable ["ACE_FTL",""]) do {
				case "RED": {_markerDetail = ["SevenR_FTL","SRColorRed",false]};
				case "BLUE": {_markerDetail = ["SevenR_FTL","SRColorBlue",false]};
				case "GREEN": {_markerDetail = ["SevenR_FTL","SRColorGreen",false]};
				case "YELLOW": {_markerDetail = ["SevenR_FTL","SRColorGold",false]};
			};
			// Draw FTL Marker
			if (count _markerDetail > 0) then {
				private _marker = createMarkerLocal [format ["ACE_BFT_FTL_%1", _forEachIndex], [(getPos  _x) select 0, (getPos _x) select 1]];
				_marker setMarkerTypeLocal (_markerDetail select 0);
				_marker setMarkerColorLocal (_markerDetail select 1);
				GVAR(BFT_markers) pushBack _marker;
			};
		}forEach _units;	
	};
};
// END_COUNTER(blueForceTrackingUpdate);
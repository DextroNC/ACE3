class CBA_Extended_EventHandlers;

#define ACE_TRENCHES_ACTIONS class ACE_Actions { \
        class ACE_MainActions { \
            displayName = ECSTRING(interaction,MainAction); \
            selection = ""; \
            distance = 3; \
            condition = QUOTE(true); \
            class ACE_ContinueDiggingTrench { \
                displayName = CSTRING(ContinueDiggingTrench); \
                condition = QUOTE([ARR_2(_target,_player)] call FUNC(canContinueDiggingTrench)); \
                statement = QUOTE([ARR_2(_target,_player)] call FUNC(continueDiggingTrench);); \
            }; \
            class ACE_RemoveTrench { \
                displayName = CSTRING(RemoveEnvelope); \
                condition = QUOTE([ARR_2(_target,_player)] call FUNC(canRemoveTrench)); \
                statement = QUOTE([ARR_2(_target,_player)] call FUNC(removeTrench);); \
            }; \
        }; \
    }

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(digEnvelopeSmall) {
                    displayName = CSTRING(DigEnvelopeSmall);
                    condition = QUOTE(_player call FUNC(canDigTrench));
                    //wait a frame to handle "Do When releasing action menu key" option
                    statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_small')])] call CBA_fnc_execNextFrame);
                    exceptions[] = {};
                    showDisabled = 0;
                    //icon = QPATHTOF(UI\icon_sandbag_ca.paa);
                };
                class GVAR(digEnvelopeBig) {
                    displayName = CSTRING(DigEnvelopeBig);
                    condition = QUOTE(_player call FUNC(canDigTrench));
                    //wait a frame to handle "Do When releasing action menu key" option
                    statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'ACE_envelope_big')])] call CBA_fnc_execNextFrame);
                    exceptions[] = {};
                    showDisabled = 0;
                    //icon = QPATHTOF(UI\icon_sandbag_ca.paa);
                };
				class GVAR(constuctionHeader) {
					displayName = "Construction";
                    condition = "'ACE_ConstructionTool' in items _player";
                    //wait a frame to handle "Do When releasing action menu key" option
                    statement = "[] call ace_trenches_fnc_displayResources";
                    exceptions[] = {};
                    showDisabled = 0;
                    //icon = QPATHTOF(UI\icon_construction.paa);
					class GVAR(digSBR) {
						displayName = "Sandbag Fence Round (1)";
						condition = "[_player,1] call ace_trenches_fnc_canConstruct";
						//wait a frame to handle "Do When releasing action menu key" option
						statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'Land_BagFence_Round_F')])] call CBA_fnc_execNextFrame);
						exceptions[] = {};
						showDisabled = 0;
						priority = 4;
						//icon = QPATHTOF(UI\icon_sandbag_ca.paa);
					};
					class GVAR(digSBL) {
						displayName = "Sandbag Fence Long (1)";
						condition = "[_player,1] call ace_trenches_fnc_canConstruct";
						//wait a frame to handle "Do When releasing action menu key" option
						statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'Land_BagFence_Long_F')])] call CBA_fnc_execNextFrame);
						exceptions[] = {};
						showDisabled = 0;
						priority = 4;
						//icon = QPATHTOF(UI\icon_sandbag_ca.paa);
					};
					class GVAR(digSBHW) {
						displayName = "Sandbag Wall Half (2)";
						condition = "[_player,2] call ace_trenches_fnc_canConstruct";
						//wait a frame to handle "Do When releasing action menu key" option
						statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'Land_SandbagBarricade_01_half_F')])] call CBA_fnc_execNextFrame);
						exceptions[] = {};
						showDisabled = 0;
						priority = 4;
						//icon = QPATHTOF(UI\icon_sandbag_ca.paa);
					};
					class GVAR(digSBW) {
						displayName = "Sandbag Wall (5)";
						condition = "[_player,5] call ace_trenches_fnc_canConstruct";
						//wait a frame to handle "Do When releasing action menu key" option
						statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'Land_SandbagBarricade_01_F')])] call CBA_fnc_execNextFrame);
						exceptions[] = {};
						showDisabled = 0;
						priority = 4;
						//icon = QPATHTOF(UI\icon_sandbag_ca.paa);
					};
					class GVAR(digSBWH) {
						displayName = "Sandbag Wall Hole (10)";
						condition = "[_player,5] call ace_trenches_fnc_canConstruct";
						//wait a frame to handle "Do When releasing action menu key" option
						statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'Land_SandbagBarricade_01_hole_F')])] call CBA_fnc_execNextFrame);
						exceptions[] = {};
						showDisabled = 0;
						priority = 4;
						//icon = QPATHTOF(UI\icon_sandbag_ca.paa);
					};
					class GVAR(digTT) {
						displayName = "Tank Trap (10)";
						condition = "[_player,5] call ace_trenches_fnc_canConstruct";
						//wait a frame to handle "Do When releasing action menu key" option
						statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'Land_CzechHedgehog_01_F')])] call CBA_fnc_execNextFrame);
						exceptions[] = {};
						showDisabled = 0;
						priority = 4;
						//icon = QPATHTOF(UI\icon_sandbag_ca.paa);
					};
					class GVAR(digRW) {
						displayName = "Razorwire (2)";
						condition = "[_player,2] call ace_trenches_fnc_canConstruct";
						//wait a frame to handle "Do When releasing action menu key" option
						statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'Land_Razorwire_F')])] call CBA_fnc_execNextFrame);
						exceptions[] = {};
						showDisabled = 0;
						priority = 4;
						//icon = QPATHTOF(UI\icon_sandbag_ca.paa);
					};			
					class GVAR(digBunker) {
						displayName = "Sandbag Bunker (20)";
						condition = "[_player,20] call ace_trenches_fnc_canConstruct";
						//wait a frame to handle "Do When releasing action menu key" option
						statement = QUOTE([ARR_2({_this call FUNC(placeTrench)},[ARR_2(_this select 0,'Land_BagBunker_Small_F')])] call CBA_fnc_execNextFrame);
						exceptions[] = {};
						showDisabled = 0;
						priority = 4;
						//icon = QPATHTOF(UI\icon_sandbag_ca.paa);
					};
				};
            };
        };
    };

    class BagFence_base_F;
    class ACE_envelope_small: BagFence_base_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeSmallName);
        descriptionShort = CSTRING(EnevlopeSmallDescription);
        model = QPATHTOEF(apl,ace_envelope_small4.p3d);
        scope = 2;
        GVAR(diggingDuration) = 20;
        GVAR(removalDuration) = 12;
        GVAR(noGeoClass) = "ACE_envelope_small_NoGeo";
        GVAR(placementData)[] = {2,3,0.35};
        GVAR(grassCuttingPoints)[] = {{0,-0.5,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
    class ACE_envelope_big: BagFence_base_F {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EnvelopeBigName);
        descriptionShort = CSTRING(EnevlopeBigDescription);
        model = QPATHTOEF(apl,ace_envelope_big4.p3d);
        scope = 2;
        GVAR(diggingDuration) = 25;
        GVAR(removalDuration) = 15;
        GVAR(noGeoClass) = "ACE_envelope_big_NoGeo";
        GVAR(placementData)[] = {6,1.1,0.20};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
    class ACE_envelope_small_NoGeo: ACE_envelope_small {
        scope = 1;
        //@todo: replace by a no geo model
        model = QPATHTOEF(apl,ace_envelope_small4_nogeo.p3d);
    };
    class ACE_envelope_big_NoGeo: ACE_envelope_big {
        scope = 1;
        //@todo: replace by a no geo model
        model = QPATHTOEF(apl,ace_envelope_big4_nogeo.p3d);
    };
	class BagBunker_base_F;
	class Land_BagBunker_Small_F: BagBunker_base_F {
		displayName = "Bunker Small (20)";
        GVAR(diggingDuration) = 20;
        GVAR(removalDuration) = 12;
        GVAR(noGeoClass) = "";
		GVAR(trenchCosts) = 20;
		GVAR(offset) = 180;
        GVAR(placementData)[] = {6,1.1,00};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
	class Land_BagFence_Round_F: BagFence_base_F {
		displayName = "Sandbag Fence Round (1)";
        GVAR(diggingDuration) = 10;
        GVAR(removalDuration) = 7;
        GVAR(noGeoClass) = "";
		GVAR(trenchCosts) = 1;
		GVAR(offset) = 180;
        GVAR(placementData)[] = {6,1.1,0};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
	class Land_BagFence_Long_F: BagFence_base_F {
		displayName = "Sandbag Fence Long (1)";
        GVAR(diggingDuration) = 10;
        GVAR(removalDuration) = 7;
        GVAR(noGeoClass) = "";
		GVAR(trenchCosts) = 1;
		GVAR(offset) = 180;
        GVAR(placementData)[] = {6,1.1,0};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
	class House_F;
	class Land_CzechHedgehog_01_F: House_F {
		displayName = "Tank Trap (10)";
        GVAR(diggingDuration) = 15;
        GVAR(removalDuration) = 12;
        GVAR(noGeoClass) = "";
		GVAR(trenchCosts) = 10;
		GVAR(offset) = 0;
        GVAR(placementData)[] = {17,1.1,0};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
	class NonStrategic;
	class Land_Razorwire_F: House_F {
		displayName = "Razorwire (5)";
        GVAR(diggingDuration) = 10;
        GVAR(removalDuration) = 7;
        GVAR(noGeoClass) = "";
		GVAR(trenchCosts) = 2;
		GVAR(offset) = 0;
        GVAR(placementData)[] = {8,1.1,0};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
	class Land_SandbagBarricade_01_half_F: House_F {
		displayName = "Sandbag Barricade Half (2)";
        GVAR(diggingDuration) = 10;
        GVAR(removalDuration) = 7;
        GVAR(noGeoClass) = "";
		GVAR(trenchCosts) = 2;
		GVAR(offset) = 180;
        GVAR(placementData)[] = {6,1.1,0};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
	class Land_SandbagBarricade_01_F: House_F {
		displayName = "Sandbag Barricade (5)";
        GVAR(diggingDuration) = 12;
        GVAR(removalDuration) = 10;
        GVAR(noGeoClass) = "";
		GVAR(trenchCosts) = 5;
		GVAR(offset) = 180;
        GVAR(placementData)[] = {12,1.1,0};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
	class Land_SandbagBarricade_01_hole_F: House_F {
		displayName = "Sandbag Barricade Hole (10)";
        GVAR(diggingDuration) = 12;
        GVAR(removalDuration) = 10;
        GVAR(noGeoClass) = "";
		GVAR(trenchCosts) = 10;
		GVAR(offset) = 180;
        GVAR(placementData)[] = {12,1.1,0};
        GVAR(grassCuttingPoints)[] = {{-1.5,-1,0},{1.5,-1,0}};
        ACE_TRENCHES_ACTIONS;
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EntrenchingTool,50);
        };
    };
};

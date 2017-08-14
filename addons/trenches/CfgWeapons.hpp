class CfgWeapons {
    class InventoryItem_Base_F;
    class ACE_ItemCore;

    class ACE_EntrenchingTool: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EntrenchingToolName);
        descriptionShort = CSTRING(EntrenchingToolDescription);
        model = QPATHTOEF(apl,ace_entrchtool.p3d);
        picture = QPATHTOF(ui\w_entrchtool_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
	class ACE_ConstructionTool: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = "Construction Tool";
        descriptionShort = "Required to construct fortifications.";
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(ui\const_tool.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 60;
        };
    };
};

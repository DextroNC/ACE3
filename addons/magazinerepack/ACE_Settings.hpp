class ACE_Settings {
    //Time to move a round from one magazine to another
    class GVAR(timePerAmmo) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(timePerAmmo);
        value = 0.25;
        typeName = "SCALAR";
        sliderSettings[] = {1, 10, 1.5, 1};
    };
    //Time to swap between magazines when repacking
    class GVAR(timePerMagazine) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(timePerMagazine);
        value = 1.0;
        typeName = "SCALAR";
        sliderSettings[] = {1, 10, 2, 1};
    };
    //Time to relink 2 belts together
    class GVAR(timePerBeltLink) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(timePerBeltLink);
        value = 3.0;
        typeName = "SCALAR";
        sliderSettings[] = {1, 10, 8, 1};
    };
};

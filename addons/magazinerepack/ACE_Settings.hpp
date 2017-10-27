class ACE_Settings {
    //Time to move a round from one magazine to another
    class GVAR(timePerAmmo) {
        value = 0.5;
        typeName = "SCALAR";
    };
    //Time to swap between magazines when repacking
    class GVAR(timePerMagazine) {
        value = 1.0;
        typeName = "SCALAR";
    };
    //Time to relink 2 belts together
    class GVAR(timePerBeltLink) {
        value = 3.0;
        typeName = "SCALAR";
    };
};

use <measurements.scad>;

module tomestone_blade_panel_middle() {
    cube([
        tomestone_blade_panel_width(),
        tomestone_blade_panel_length(),
        tomestone_blade_panel_height()
    ]);
};
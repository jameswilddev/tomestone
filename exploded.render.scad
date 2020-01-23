include <quality.scad>;
include <top.scad>;
include <bottom.scad>;
include <blade_panel_end.scad>;
include <blade_panel_middle.scad>;
include <battery.scad>;

tomestone_top();

translate([tomestone_blade_spacing(), tomestone_blade_spacing(), 0]) {
    tomestone_blade_panel_end();
};

translate([tomestone_blade_spacing() * 5, tomestone_blade_spacing(), 0]) {
    tomestone_blade_panel_middle();
};

translate([tomestone_blade_spacing() * 9, tomestone_blade_spacing(), 0]) {
    tomestone_blade_panel_middle();
};

translate([tomestone_outer_width() - tomestone_blade_spacing(), tomestone_blade_spacing(), tomestone_blade_panel_height()]) {
    rotate([0, 180, 0]) {
        tomestone_blade_panel_end();
    };
};

translate([0, 0, -10]) {
    tomestone_battery();
};

translate([0, 0, -20]) {
    tomestone_bottom();
};
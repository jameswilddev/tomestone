use <measurements.scad>;
use <outer.scad>;
use <blade.scad>;

function tomestone_top_height() = tomestone_outer_height() - tomestone_bottom_height();

module tomestone_top() {
    difference() {
        // Slice the bottom off.
        intersection() {
            translate([0, 0, -tomestone_bottom_height()]) {
                tomestone_outer();
            };
            
            cube([
                tomestone_outer_width(),
                tomestone_outer_length(),
                tomestone_top_height()
            ]);
        };
        
        // Cut out the blade cutouts.
        linear_extrude(tomestone_top_height()) {
            tomestone_blade_cutout();
        };
        
        // Cut out the blade insets.
        translate([
            0,
            0,
            tomestone_top_height() - tomestone_blade_inset_height()
        ]) {
            linear_extrude(tomestone_blade_inset_height()) {
                tomestone_blade_inset();
            };        
        };
    };
};
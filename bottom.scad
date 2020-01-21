use <measurements.scad>;
use <outer.scad>;

module tomestone_bottom() {
    // Slice the top off.
    intersection() {
        tomestone_outer();
        
        cube([
            tomestone_outer_width(),
            tomestone_outer_length(),
            tomestone_bottom_height()
        ]);
    };
};
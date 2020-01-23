include <quality.scad>;
use <measurements.scad>;
use <top.scad>;

translate([
    tomestone_outer_width(),
    0,
    tomestone_outer_height(),
]) {
    rotate([0, 180, 0]) {
        tomestone_top();
    };
};
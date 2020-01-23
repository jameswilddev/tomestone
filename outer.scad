use <measurements.scad>;

module tomestone_outer() {
    left = tomestone_outer_radius();
    right = tomestone_outer_width() - left;
    near = tomestone_outer_radius();
    far = tomestone_outer_length() - near;
    top = tomestone_outer_height() - tomestone_bottom_height();

    intersection() {
        cube([
            tomestone_outer_width(),
            tomestone_outer_length(),
            tomestone_outer_height()
        ]);

        hull() {
            translate([left, near, tomestone_bottom_height()]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([left, near, top]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([left, far, tomestone_bottom_height()]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([left, far, top]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([right, near, tomestone_bottom_height()]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([right, near, top]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([right, far, tomestone_bottom_height()]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([right, far, top]) {
                sphere(r = tomestone_outer_radius());
            };
        };
    };
};
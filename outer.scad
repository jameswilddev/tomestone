use <measurements.scad>;

module tomestone_outer() {
    left = tomestone_outer_radius();
    right = tomestone_outer_width() - left;
    near = tomestone_outer_radius();
    far = tomestone_outer_length() - near;
    bottom = sin(acos((tomestone_blade_spacing() + tomestone_outer_border()) / tomestone_outer_radius())) * tomestone_outer_radius();
    top = tomestone_outer_height() - bottom;

    intersection() {
        cube([
            tomestone_outer_width(),
            tomestone_outer_length(),
            tomestone_outer_height()
        ]);

        hull() {
            translate([left, near, bottom]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([left, near, top]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([left, far, bottom]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([left, far, top]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([right, near, bottom]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([right, near, top]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([right, far, bottom]) {
                sphere(r = tomestone_outer_radius());
            };
            
            translate([right, far, top]) {
                sphere(r = tomestone_outer_radius());
            };
        };
    };
};
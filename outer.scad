use <measurements.scad>;

module tomestone_outer(push_xy, push_z) {
    left = tomestone_outer_radius();
    right = tomestone_outer_width() - left;
    near = tomestone_outer_radius();
    far = tomestone_outer_length() - near;
    top = tomestone_outer_height() - tomestone_bottom_height();
    
    radius = tomestone_outer_radius() + push_xy;

    intersection() {
        translate([-push_xy, -push_xy, -push_z]) {
            cube([
                tomestone_outer_width() + push_xy * 2,
                tomestone_outer_length() + push_xy * 2,
                tomestone_outer_height() + push_z * 2
            ]);
        };

        hull() {
            translate([left, near, tomestone_bottom_height()]) {
                sphere(r = radius);
            };
            
            translate([left, near, top]) {
                sphere(r = radius);
            };
            
            translate([left, far, tomestone_bottom_height()]) {
                sphere(r = radius);
            };
            
            translate([left, far, top]) {
                sphere(r = radius);
            };
            
            translate([right, near, tomestone_bottom_height()]) {
                sphere(r = radius);
            };
            
            translate([right, near, top]) {
                sphere(r = radius);
            };
            
            translate([right, far, tomestone_bottom_height()]) {
                sphere(r = radius);
            };
            
            translate([right, far, top]) {
                sphere(r = radius);
            };
        };
    };
};
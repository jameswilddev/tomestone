use <measurements.scad>;

module tomestone_outer(push) {
    left = tomestone_outer_radius();
    right = tomestone_outer_width() - left;
    near = tomestone_outer_radius();
    far = tomestone_outer_length() - near;
    top = tomestone_outer_height() - tomestone_bottom_height();
    
    radius = tomestone_outer_radius() + push;

    intersection() {
        translate([-push, -push, -push]) {
            cube([
                tomestone_outer_width() + push * 2,
                tomestone_outer_length() + push * 2,
                tomestone_outer_height() + push * 2
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
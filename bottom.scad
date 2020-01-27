use <measurements.scad>;
use <outer.scad>;
use <engraving.scad>;

module tomestone_bottom() {   
    led_origins = [
        [
            tomestone_outer_width() / 3,
            tomestone_outer_length() / 3,
        ],
        [
            tomestone_outer_width() * 2 / 3,
            tomestone_outer_length() / 3,
        ],
        [
            tomestone_outer_width() / 3,
            tomestone_outer_length() * 2 / 3,
        ],
        [
            tomestone_outer_width() * 2 / 3,
            tomestone_outer_length() * 2 / 3,
        ],
    ];
    
    difference() {
        union() {
            // Slice the top off.
            intersection() {
                tomestone_outer(0);
                
                cube([
                    tomestone_outer_width(),
                    tomestone_outer_length(),
                    tomestone_bottom_height()
                ]);
            };
            
            // Fill the rest of the remaining space until the top.
            intersection() {
                tomestone_outer(0 - tomestone_outer_thickness() - tomestone_tolerance());
                
                cube([
                    tomestone_outer_width(),
                    tomestone_outer_length(),
                    tomestone_outer_height() - tomestone_blade_cutout_height() - tomestone_blade_panel_height() - tomestone_blade_clip_height() - tomestone_tolerance() * 2
                ]);
            };
        };
        
        // Underside engraving.
        translate([tomestone_outer_width() / 2, tomestone_outer_length() / 2 + 12, 0]) {
            linear_extrude(tomestone_engraving_height()) {
                scale([-1, 1]) {
                    tomestone_engraving();
                };
            };
        };
        
        // Reflector domes for LEDs.
        intersection() {
            tomestone_outer(0 - tomestone_outer_thickness() - tomestone_inner_thickness());
            
            for (led_origin = led_origins) {
                translate([
                    led_origin[0],
                    led_origin[1],
                    tomestone_outer_thickness() + tomestone_reflector_radius()
                ]) {
                    sphere(r = tomestone_reflector_radius());
                };
            };
        };
    };
};

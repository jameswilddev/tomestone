use <measurements.scad>;
use <outer.scad>;
use <blade.scad>;

module tomestone_top() {
    trim_with_tolerance = tomestone_blade_panel_trim() + tomestone_tolerance();
    
    difference() {
        tomestone_outer(0);
        
        // Slice the bottom off.           
        cube([
            tomestone_outer_width(),
            tomestone_outer_length(),
            tomestone_bottom_height()
        ]);
        
        // Carve the inside out.
        intersection() {
            tomestone_outer(-tomestone_outer_thickness());
            
            cube([
                tomestone_outer_width(),
                tomestone_outer_length(),
                tomestone_outer_height() - tomestone_blade_cutout_height() - tomestone_blade_panel_height() - tomestone_blade_clip_height() - tomestone_tolerance()
            ]);
        };
        
        // Cut out the blade cutouts.
        linear_extrude(tomestone_outer_height()) {
            tomestone_blade_cutout();
        };
        
        // Cut out the blade insets.
        translate([
            0,
            0,
            tomestone_outer_height() - tomestone_blade_inset_height()
        ]) {
            linear_extrude(tomestone_blade_inset_height()) {
                tomestone_blade_inset();
            };        
        };
        
        // Cut out pockets for blade panels.
        near = tomestone_blade_spacing() - trim_with_tolerance;
        far = tomestone_outer_length() - near;
        width = tomestone_blade_spacing() * 3 + trim_with_tolerance * 2;
        length = far - near;
        radius = tomestone_blade_spacing() + trim_with_tolerance;
        radius_left = near + radius;
        radius_right = tomestone_outer_width() - radius_left;
        radius_near = radius_left;
        radius_far = tomestone_outer_length() - radius_near;
        radius_square_width = width - radius;
             
        linear_extrude(tomestone_outer_height() - tomestone_blade_cutout_height()) {
            // Leftmost panel.
            hull() {
                translate([
                    radius_left,
                    radius_near
                ]) {
                    circle(r = radius);
                };
                
                translate([
                    radius_left,
                    radius_far
                ]) {
                    circle(r = radius);
                };
                
                translate([
                    radius_left,
                    near
                ]) {
                    square([
                        radius_square_width,
                        length
                    ]);
                };
            };
            
            // Middle panels.
            for (blade = [1 : 2]) { 
                translate([
                    (blade * 4 + 1) * tomestone_blade_spacing() - trim_with_tolerance,
                    near
                ]) {
                    square([width, length]);
                };
            };
            
            // Rightmost panel.
            hull() {
                translate([
                    radius_right,
                    radius_near
                ]) {
                    circle(r = radius);
                };
                
                translate([
                    radius_right,
                    radius_far
                ]) {
                    circle(r = radius);
                };
                
                translate([
                    radius_right - radius_square_width,
                    near
                ]) {
                    square([
                        radius_square_width,
                        length
                    ]);
                };
            };
        };
    };
    
    // Blade panel retaining clips.
    translate([0, 0, tomestone_outer_height() - tomestone_blade_cutout_height() - tomestone_blade_panel_height() - tomestone_blade_clip_height() - tomestone_tolerance()]) {
        linear_extrude(tomestone_blade_clip_height()) {
            for (blade = [1 : tomestone_blade_count()]) {
                translate([(blade * 4 - 3) * tomestone_blade_spacing() - trim_with_tolerance, 0]) {
                    for (clip = [1 : tomestone_blade_clip_count()]) {
                        translate([
                            0,
                            tomestone_outer_length() * clip / (tomestone_blade_clip_count() + 1) - tomestone_blade_clip_length() / 2
                        ]) {
                            // Left.
                            square([tomestone_blade_clip_width(), tomestone_blade_clip_length()]);
                            
                            // Right.
                            translate([
                                tomestone_blade_spacing() * 3 + trim_with_tolerance * 2 - tomestone_blade_clip_width(),
                                0
                            ]) {
                                square([tomestone_blade_clip_width(), tomestone_blade_clip_length()]);
                            };
                        };
                    };
                    
                    translate([
                        (tomestone_blade_spacing() * 3 + trim_with_tolerance * 2 - tomestone_blade_clip_length()) / 2,
                        0
                    ]) {
                        translate([
                            0,
                            tomestone_blade_spacing() - trim_with_tolerance
                        ]) {
                            square([
                                tomestone_blade_clip_length(),
                                tomestone_blade_clip_width()
                            ]);                        
                        };
                        
                        translate([
                            0,
                            tomestone_outer_length() - tomestone_blade_spacing() + trim_with_tolerance - tomestone_blade_clip_width()
                        ]) {
                            square([
                                tomestone_blade_clip_length(),
                                tomestone_blade_clip_width()
                            ]);                        
                        };
                    };
                };
            };
        };
    };
};
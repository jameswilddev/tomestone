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
        
        // Cut out pockets for blade panels.
        near = tomestone_blade_spacing() - tomestone_blade_panel_trim();
        far = tomestone_outer_length() - near;
        width = tomestone_blade_spacing() * 3 + tomestone_blade_panel_trim() * 2;
        length = far - near;
        radius = tomestone_blade_spacing() + tomestone_blade_panel_trim();
        radius_left = near + radius;
        radius_right = tomestone_outer_width() - radius_left;
        radius_near = radius_left;
        radius_far = tomestone_outer_length() - radius_near;
        radius_square_width = width - radius;
             
        linear_extrude(tomestone_top_height() - tomestone_blade_cutout_height()) {
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
                    (blade * 4 + 1) * tomestone_blade_spacing() - tomestone_blade_panel_trim(),
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
    translate([0, 0, tomestone_top_height() - tomestone_blade_cutout_height() - tomestone_blade_panel_height() - tomestone_blade_clip_height()]) {
        linear_extrude(tomestone_blade_clip_height()) {
            for (blade = [1 : tomestone_blade_count()]) {
                translate([(blade * 4 - 3) * tomestone_blade_spacing() - tomestone_blade_panel_trim(), 0]) {
                    translate([
                        0,
                        (tomestone_outer_length() - tomestone_blade_clip_length()) / 2
                    ]) {
                        // Left.
                        square([tomestone_blade_clip_width(), tomestone_blade_clip_length()]);
                        
                        // Right.
                        translate([
                            tomestone_blade_spacing() * 3 + tomestone_blade_panel_trim() * 2 - tomestone_blade_clip_width(),
                            0
                        ]) {
                            square([tomestone_blade_clip_width(), tomestone_blade_clip_length()]);
                        };
                    };
                    
                    translate([
                        (tomestone_blade_spacing() * 3 + tomestone_blade_panel_trim() * 2 - tomestone_blade_clip_length()) / 2,
                        0
                    ]) {
                        translate([
                            0,
                            tomestone_blade_spacing() - tomestone_blade_panel_trim()
                        ]) {
                            square([
                                tomestone_blade_clip_length(),
                                tomestone_blade_clip_width()
                            ]);                        
                        };
                        
                        translate([
                            0,
                            tomestone_outer_length() - tomestone_blade_spacing() + tomestone_blade_panel_trim() - tomestone_blade_clip_width()
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
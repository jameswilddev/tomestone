use <measurements.scad>;

function tomestone_blade_ramp_far() = tomestone_blade_ramp_near() + tomestone_blade_ramp_length();

function tomestone_blade_gradient_gap(
    gradient_x,
    gradient_y,
    gap
) = let (
    angle = atan2(gradient_y, gradient_x),
    x = -sin(angle),
    y = cos(angle),
    gradient = y - x * gradient_y / gradient_x
) gradient * gap;

module tomestone_blade_area() {
    translate([
        tomestone_blade_spacing(),
        tomestone_blade_spacing()
    ]) {
        hull() {
            left = tomestone_blade_spacing();
            right = tomestone_blade_width() - tomestone_blade_spacing();
            near = tomestone_blade_spacing();
            far = tomestone_blade_length() - tomestone_blade_spacing();
            
            translate([left, near]) {
                circle(r = tomestone_blade_spacing());
            };
            
            translate([left, far]) {
                circle(r = tomestone_blade_spacing());
            };

            translate([right, near]) {
                circle(r = tomestone_blade_spacing());
            };
            
            translate([right, far]) {
                circle(r = tomestone_blade_spacing());
            };
        };
    };
};


module tomestone_blade_inset() {    
    intersection() {
        tomestone_blade_area();
        
        translate([
            tomestone_blade_spacing(),
            tomestone_blade_spacing()
        ]) {
            difference() {
                for (blade = [1 : tomestone_blade_count()]) {
                    translate([
                        (blade * 4 - 2) * tomestone_blade_spacing(),
                        0
                    ]) {
                        square([tomestone_blade_spacing(), tomestone_blade_length()]);
                    };
                }; 
                
                // Cut the ramp out of the far end.
                gap = tomestone_blade_gradient_gap(
                    tomestone_blade_width(), 
                    tomestone_blade_ramp_length(),
                    tomestone_blade_spacing()
                );
                
                ramp_near = tomestone_blade_ramp_near() - gap;
                ramp_far = tomestone_blade_ramp_far() - gap;
                
                polygon([
                    [0, ramp_near],
                    [0, tomestone_blade_length()],
                    [tomestone_blade_width(), tomestone_blade_length()],
                    [tomestone_blade_width(), ramp_far],
                ]);
                
                // Cut the "crossbrace" out.
                translate([
                    0,
                    ramp_near - tomestone_blade_spacing()
                ]) {
                    square([
                        tomestone_blade_width(),
                        tomestone_blade_spacing()
                    ]);
                };
            };
        };
    };
};

module tomestone_blade_cutout() {
    intersection() {
        tomestone_blade_area();
        
        translate([
            tomestone_blade_spacing(),
            tomestone_blade_spacing()
        ]) {
            difference() {        
                difference() {
                    union() {        
                        // Cut the spaces between blades out of the ramp/far.
                        difference() {
                            polygon([
                                [0, tomestone_blade_ramp_near()],
                                [0, tomestone_blade_length()],
                                [tomestone_blade_width(), tomestone_blade_length()],
                                [tomestone_blade_width(), tomestone_blade_ramp_far()],
                            ]);
                        
                            for (blade = [1 : tomestone_blade_count()]) {
                                translate([
                                    (blade * 4 - 1) * tomestone_blade_spacing(),
                                    0
                                ]) {
                                    square([tomestone_blade_spacing(), tomestone_blade_length()]);
                                };
                            };
                        };
                    
                        // Add the "stems" in the near left of the blades.
                        for (blade = [1 : tomestone_blade_count()]) {
                            translate([
                                (blade - 1) * 4 * tomestone_blade_spacing(),
                                0
                            ]) {
                                square([tomestone_blade_spacing(), tomestone_blade_length()]);
                            };
                        };
                    };
                };
            
                // Cut the gap around the detail out of the ramp/far.
                for (blade = [1 : tomestone_blade_count()]) {
                    left = (blade - 1) * 4 * tomestone_blade_spacing();
                    island_right = left + tomestone_blade_detail_width();
                    island_left_far = tomestone_blade_length() - tomestone_blade_detail_far();
                    island_left_near = island_left_far - tomestone_blade_detail_outer();
                    outer_inner_difference = (tomestone_blade_detail_outer() - tomestone_blade_detail_inner()) / 2;
                    island_right_far = island_left_far - outer_inner_difference;
                    island_right_near = island_left_near + outer_inner_difference;
                    
                    gap_right = island_right + tomestone_blade_detail_gap();
                    outer_offset = tomestone_blade_gradient_gap(tomestone_blade_detail_width(), outer_inner_difference, tomestone_blade_detail_gap());
                    inner_offset = outer_offset - outer_inner_difference * tomestone_blade_detail_gap() / tomestone_blade_detail_width();
                    gap_left_far = island_left_far + outer_offset;
                    gap_right_far = island_right_far + inner_offset;
                    gap_left_near = island_left_near - outer_offset;
                    gap_right_near = island_right_near - inner_offset;
                    
                    difference() {
                        // The gap.
                        polygon([
                            [left, gap_left_near],
                            [left, gap_left_far],
                            [gap_right, gap_right_far],
                            [gap_right, gap_right_near]
                        ]);
                        
                        // The island.
                        polygon([
                            [left, island_left_near],
                            [left, island_left_far],
                            [island_right, island_right_far],
                            [island_right, island_right_near]
                        ]);
                    };
                };
            };
        };
    };
};
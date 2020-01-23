use <measurements.scad>;

module tomestone_slide() {
    tab_width = tomestone_outer_thickness() + tomestone_tolerance() * 2;
    
    translate([
        tomestone_outer_width() - tab_width - tomestone_slide_rail_width(),
        tomestone_slide_near(),
        tomestone_slide_bottom(),
    ]) {
        length = tomestone_outer_length() - tomestone_slide_near() - tomestone_slide_far();
        height = tomestone_outer_height() - tomestone_slide_top() - tomestone_slide_bottom();

        // The rail inside the chassis.
        cube([
            tomestone_slide_rail_width(),
            length,
            height
        ]);
        
        // The tab connecting the rail and slide.
        translate([
            tomestone_slide_rail_width(),
            tomestone_slide_overlap_length(),
            tomestone_slide_overlap_height()
        ]) {
            cube([
                tab_width,
                length - tomestone_slide_overlap_length() * 2,
                height - tomestone_slide_overlap_height() * 2
            ]);
        };        
        
        // The externally visible slide.
        linear_extrude(height) {
            left = tomestone_slide_rail_width() + tab_width;

            right = left + tomestone_slide_width();
            far = tomestone_outer_length() - tomestone_slide_far();

            radius_x = right - tomestone_slide_radius();
            radius_y = length - tomestone_slide_radius();

            polygon([
                [left, 0],
                [left, length],
                [radius_x, length],
                [right, radius_y],
                [right, tomestone_slide_width()],
            ]);
            
            translate([radius_x, radius_y]) {
                circle(r = tomestone_slide_radius());
            };
        };
    };
};
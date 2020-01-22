use <measurements.scad>;

module tomestone_blade_panel_end() {
    radius = tomestone_blade_spacing() + tomestone_blade_panel_trim();
    
    linear_extrude(tomestone_blade_panel_height()) {
        hull() {
            translate([radius, radius]) {
                circle(r = radius);
            };

            translate([radius, tomestone_blade_panel_length() - radius]) {
                circle(r = radius);
            };
            
            translate([radius, 0]) {
                square([tomestone_blade_panel_width() - radius, tomestone_blade_panel_length()]);
            };
        };
    };
};
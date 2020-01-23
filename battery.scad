use <measurements.scad>;

module tomestone_battery() {
    linear_extrude(tomestone_battery_height()) {
        translate([
            tomestone_battery_length() / 2,
            tomestone_battery_length() / 2
        ]) {
            circle(d = tomestone_battery_length());
        };
        
        translate([
            tomestone_battery_length() / 2,
            0
        ]) {
            square([
                tomestone_battery_width() - tomestone_battery_length() / 2,
                tomestone_battery_length()
            ]);
        };
    };
};
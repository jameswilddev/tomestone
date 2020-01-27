function tomestone_engraving_sunruse_points() = 12;
function tomestone_engraving_sunruse_outer() = 15;
function tomestone_engraving_sunruse_inner() = 10;

function tomestone_engraving_radius() = 2;

function tomestone_engraving_sunruse_point(i, radius) = [
    sin(i * 360 / tomestone_engraving_sunruse_points()) * radius,
    cos(i * 360 / tomestone_engraving_sunruse_points()) * radius,
];

function tomestone_engraving_sunruse_point_outer(i) = tomestone_engraving_sunruse_point(i, tomestone_engraving_sunruse_outer());
function tomestone_engraving_sunruse_point_inner(i) = tomestone_engraving_sunruse_point(i, tomestone_engraving_sunruse_inner());

module tomestone_engraving() {
    difference() {
        union() {
            hull() {
                translate([
                    tomestone_engraving_sunruse_outer(),
                    tomestone_engraving_sunruse_outer()
                ]) {
                    circle(r = tomestone_engraving_radius());
                };
                
                translate([
                    tomestone_engraving_sunruse_outer(), 
                    -tomestone_engraving_sunruse_outer()
                ]) {
                    circle(r = tomestone_engraving_radius());
                };
                
                translate([
                    -tomestone_engraving_sunruse_outer(),
                    tomestone_engraving_sunruse_outer()
                ]) {
                    circle(r = tomestone_engraving_radius());
                };
                
                translate([
                    -tomestone_engraving_sunruse_outer(), 
                    -tomestone_engraving_sunruse_outer()
                ]) {
                    circle(r = tomestone_engraving_radius());
                };
            };
            
            hull() {
                width = 25.75;
                top = -17;
                bottom = -31;
                
                translate([width, top]) {
                    circle(r = tomestone_engraving_radius());
                };
                
                translate([width, bottom]) {
                    circle(r = tomestone_engraving_radius());
                };
                
                translate([-width, top]) {
                    circle(r = tomestone_engraving_radius());
                };
                
                translate([-width, bottom]) {
                    circle(r = tomestone_engraving_radius());
                };
            };
        };
        
        union() {
            difference() {
                polygon([
                    tomestone_engraving_sunruse_point_outer(0),
                    tomestone_engraving_sunruse_point_inner(0.5),
                    tomestone_engraving_sunruse_point_outer(1),
                    tomestone_engraving_sunruse_point_inner(1.5),
                    tomestone_engraving_sunruse_point_outer(2),
                    tomestone_engraving_sunruse_point_inner(2.5),
                    tomestone_engraving_sunruse_point_outer(3),
                    tomestone_engraving_sunruse_point_inner(3.5),
                    tomestone_engraving_sunruse_point_outer(4),
                    tomestone_engraving_sunruse_point_inner(4.5),
                    tomestone_engraving_sunruse_point_outer(5),
                    tomestone_engraving_sunruse_point_inner(5.5),
                    tomestone_engraving_sunruse_point_outer(6),
                    tomestone_engraving_sunruse_point_inner(6.5),
                    tomestone_engraving_sunruse_point_outer(7),
                    tomestone_engraving_sunruse_point_inner(7.5),
                    tomestone_engraving_sunruse_point_outer(8),
                    tomestone_engraving_sunruse_point_inner(8.5),
                    tomestone_engraving_sunruse_point_outer(9),
                    tomestone_engraving_sunruse_point_inner(9.5),
                    tomestone_engraving_sunruse_point_outer(10),
                    tomestone_engraving_sunruse_point_inner(10.5),
                    tomestone_engraving_sunruse_point_outer(11),
                    tomestone_engraving_sunruse_point_inner(11.5),
                ]);
                circle(r = tomestone_engraving_sunruse_inner());
            };

            translate([0, -19.5]) {
                text("Allagan Tomestone of Poetics", size = 2.9, font = "Source Sans Pro:style=Bold", halign = "center", valign = "center");
            };

            translate([0, -25]) {
                text("Designed in Eorzea", size = 2.9, font = "Source Sans Pro:style=Bold", halign = "center", valign = "center");
            };

            translate([0, -29.5]) {
                text("Bodged in Midlands, GB", size = 2.9, font = "Source Sans Pro:style=Bold", halign = "center", valign = "center");
            };
        };
    };
};
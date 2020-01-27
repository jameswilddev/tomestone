function tomestone_tolerance() = 0.15;

function tomestone_outer_width() = 64;
function tomestone_outer_length() = 120;
function tomestone_outer_height() = 15;
function tomestone_outer_radius() = tomestone_blade_spacing() * 2;
function tomestone_outer_border() = 0.5;
function tomestone_outer_thickness() = 2;
function tomestone_inner_thickness() = 1.5;
function tomestone_engraving_height() = 0.2;
function tomestone_reflector_radius() = 40;

function tomestone_blade_count() = 4;
function tomestone_blade_spacing() = tomestone_outer_width() / (tomestone_blade_count() * 4 + 1);
function tomestone_blade_detail_far() = 19.125;
function tomestone_blade_detail_gap() = 3;
function tomestone_blade_detail_outer() = 18;
function tomestone_blade_detail_inner() = 12.75;
function tomestone_blade_detail_width() = 2.625;
function tomestone_blade_ramp_length() = 35;
function tomestone_blade_ramp_near() = 25;

function tomestone_bottom_height() = sin(acos((tomestone_blade_spacing() + tomestone_outer_border()) / tomestone_outer_radius())) * tomestone_outer_radius();

function tomestone_blade_cutout_height() = 2;
function tomestone_blade_inset_height() = 1.2;
function tomestone_blade_panel_height() = 0.6;
function tomestone_blade_panel_trim() = 0.5;
function tomestone_blade_panel_width() = tomestone_blade_spacing() * 3 + tomestone_blade_panel_trim() * 2;
function tomestone_blade_panel_length() = tomestone_blade_length() + tomestone_blade_panel_trim() * 2;
function tomestone_blade_clip_count() = 3;
function tomestone_blade_clip_height() = 0.6;
function tomestone_blade_clip_length() = 2;
function tomestone_blade_clip_width() = 0.5;
function tomestone_blade_width() = tomestone_outer_width() - tomestone_blade_spacing() * 2;
function tomestone_blade_length() = tomestone_outer_length() - tomestone_blade_spacing() * 2;

function tomestone_battery_width() = 51;
function tomestone_battery_switch_width() = 2.5;
function tomestone_battery_switch_length() = 1.5;
function tomestone_battery_switch_throw() = 2;
function tomestone_battery_length() = 23.7;
function tomestone_battery_height() = 6;

function tomestone_slide_top() = 4;
function tomestone_slide_overlap_height() = 2;
function tomestone_slide_bottom() = 4;

function tomestone_slide_far() = 10;
function tomestone_slide_radius() = 3.75;
function tomestone_slide_width() = 7.5;
function tomestone_slide_rail_width() = 2;
function tomestone_slide_overlap_length() = 3;
function tomestone_slide_near() = 10;

function tomestone_led_diameter() = 3;
function tomestone_led_height() = 5.2;
function tomestone_led_lip_height() = 0.85;
function tomestone_led_lip_diameter() = 3.75;
function tomestone_led_lead_spacing() = 2.5;
function tomestone_led_lead_diameter() = 0.4;
function tomestone_led_clip_height() = 0.6;
function tomestone_led_clip_length() = 0.2;

function tomestone_resistor_diameter_outer() = 2.15;
function tomestone_resistor_length() = 5.75;
function tomestone_resistor_diameter_inner() = 1.6;
function tomestone_resistor_lead_diameter() = 0.2;
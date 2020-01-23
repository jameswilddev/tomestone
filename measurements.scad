function tomestone_tolerance() = 0.25;

function tomestone_outer_width() = 64;
function tomestone_outer_length() = 120;
function tomestone_outer_height() = 15;
function tomestone_outer_radius() = tomestone_blade_spacing() * 2;
function tomestone_outer_border() = 0.5;
function tomestone_outer_thickness() = 2;

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
function tomestone_blade_panel_height() = 0.8;
function tomestone_blade_panel_trim() = 0.5;
function tomestone_blade_panel_width() = tomestone_blade_spacing() * 3 + tomestone_blade_panel_trim() * 2;
function tomestone_blade_panel_length() = tomestone_blade_length() + tomestone_blade_panel_trim() * 2;
function tomestone_blade_clip_height() = 0.6;
function tomestone_blade_clip_length() = 2;
function tomestone_blade_clip_width() = 0.5;
function tomestone_blade_width() = tomestone_outer_width() - tomestone_blade_spacing() * 2;
function tomestone_blade_length() = tomestone_outer_length() - tomestone_blade_spacing() * 2;
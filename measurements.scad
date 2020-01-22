function tomestone_outer_width() = 40;
function tomestone_outer_length() = 70;
function tomestone_outer_height() = 20;
function tomestone_outer_radius() = 5;
function tomestone_outer_border() = 0.5;
function tomestone_outer_thickness() = 2;

function tomestone_blade_count() = 4;
function tomestone_blade_spacing() = tomestone_outer_width() / (tomestone_blade_count() * 4 + 1);
function tomestone_blade_detail_far() = 10;
function tomestone_blade_detail_gap() = 1;
function tomestone_blade_detail_outer() = 10;
function tomestone_blade_detail_inner() = 8;
function tomestone_blade_detail_width() = 2;
function tomestone_blade_ramp_length() = 15;
function tomestone_blade_ramp_near() = 15;

function tomestone_bottom_height() = 5;

function tomestone_blade_cutout_height() = 3;
function tomestone_blade_inset_height() = 0.8;
function tomestone_blade_panel_height() = 0.4;
function tomestone_blade_panel_trim() = 1;
function tomestone_blade_panel_width() = tomestone_blade_spacing() * 3 + tomestone_blade_panel_trim() * 2;
function tomestone_blade_panel_length() = tomestone_blade_length() + tomestone_blade_panel_trim() * 2;
function tomestone_blade_clip_height() = 1.2;
function tomestone_blade_clip_length() = 5;
function tomestone_blade_clip_width() = 1;
function tomestone_blade_width() = tomestone_outer_width() - tomestone_blade_spacing() * 2;
function tomestone_blade_length() = tomestone_outer_length() - tomestone_blade_spacing() * 2;
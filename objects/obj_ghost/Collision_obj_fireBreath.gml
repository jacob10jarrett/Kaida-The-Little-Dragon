if (psys == -1) {
    psys = part_system_create();
}

if (ptype == -1) {
    ptype = part_type_create();
    part_type_shape(ptype, pt_shape_smoke);
    part_type_scale(ptype, 0.5, 1);
    part_type_color2(ptype, make_color_rgb(0, 255, 255), c_white);
    part_type_alpha2(ptype, 1, 0);
    part_type_speed(ptype, 0.5, 1, -0.01, 0);
    part_type_life(ptype, 30, 180);
}

pemit = part_emitter_create(psys);
part_emitter_region(psys, pemit, x-0, x+125, y-65, y+135, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(psys, pemit, ptype, 50); 


alarm[3] = room_speed * .1; 
alarm[4] = room_speed * 2; 
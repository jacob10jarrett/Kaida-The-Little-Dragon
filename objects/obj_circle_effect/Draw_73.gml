if (surface_exists(global.darknessSurface)) {
    surface_set_target(global.darknessSurface);
    draw_clear_alpha(c_black, 1);
    
    var px = obj_player.x;
    var py = obj_player.y;

    gpu_set_blendmode(bm_subtract);
    draw_circle_color(px, py, global.maskRadius, c_white, c_white, false);
    gpu_set_blendmode(bm_normal);
    
    surface_reset_target();
    draw_surface(global.darknessSurface, 0, 0);
}

if (global.expanding && global.maskRadius < max(room_width, room_height)) {
    global.maskRadius += global.expandSpeed;
}
if (!variable_global_exists("initialized_circle_effect") || !global.initialized_circle_effect) {
    alarm[0] = room_speed * 1.5;
    global.expanding = false;

    global.darknessSurface = -1; 
    global.maskRadius = 64; 
    global.expandSpeed = 10;

    if (!surface_exists(global.darknessSurface) || global.darknessSurface == -1) {
        global.darknessSurface = surface_create(room_width, room_height);
    }

    global.initialized_circle_effect = true;
}

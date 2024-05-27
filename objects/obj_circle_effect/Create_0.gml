alarm[0] = 360; 
global.expanding = false;

global.darknessSurface = -1; 
global.maskRadius = 64; 
global.expandSpeed = 10;

if (!surface_exists(global.darknessSurface) || global.darknessSurface == -1) {
    global.darknessSurface = surface_create(room_width, room_height);
}
if (surface_exists(global.darknessSurface) && global.darknessSurface != -1) {
    surface_free(global.darknessSurface);
    global.darknessSurface = -1; 
}

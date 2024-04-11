if (surface_exists(global.darknessSurface)) {
    surface_free(global.darknessSurface);
    global.darknessSurface = undefined;
}
var parallax_factor_1 = 0.02;
var parallax_factor_2 = 0.7;
var parallax_factor_3 = 1.0;

var camera_x = camera_get_view_x(view_camera[0]);

layer_x("Background_Layer_1", -camera_x * parallax_factor_1);
layer_x("Background_Layer_2", -camera_x * parallax_factor_2);
layer_x("Foreground_Layer", -camera_x * parallax_factor_3);
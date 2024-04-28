var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

var target_x = cam_x - (cam_x * parallax_factor);
var target_y = cam_y - (cam_y * parallax_factor);

x += (target_x - x);
y += (target_y - y);
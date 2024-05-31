var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

initial_x -= move_speed;

var cloud_parallax_x = cam_x + (initial_x - cam_x) * parallax_factor;
var cloud_parallax_y = cam_y + (initial_y - cam_y) * parallax_factor;

x = cloud_parallax_x + 400;
y = cloud_parallax_y;

if (cloud_parallax_x < cam_x - sprite_width) {
    initial_x = cam_x + camera_get_view_width(view_camera[0]);
}

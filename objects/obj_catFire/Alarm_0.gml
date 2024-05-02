var cat_right = instance_position(x + sprite_width-50, y, obj_catGrey);

if (cat_right != noone) { 
    hspeed = -10;
	image_angle = -90
} else {
    hspeed = 10;
	image_angle = 90
}

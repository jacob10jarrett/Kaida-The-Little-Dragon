//flip direction upon ledge


if !(instance_place(x+hspeed, y+1, obj_block))
{
	hspeed = hspeed * -1;

	//flip sprite orientation
	image_xscale = image_xscale * -1;
}

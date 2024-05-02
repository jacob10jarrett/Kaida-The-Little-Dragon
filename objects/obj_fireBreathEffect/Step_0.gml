if (sign(obj_player.image_xscale) < 1)
{
	x = obj_player.x -49
	y = obj_player.y -15
	image_xscale = -1
}

else 
{
	x = obj_player.x + 49;
	y = obj_player.y -15
	image_xscale = 1;
}


if (instance_exists(obj_player))
{
	//check if player is in range
	if (distance_to_object(obj_player) < attack_range)
	{
		//break from path
		path_end();
		
		//direct towrards play pos.
		direction = point_direction(x,y,obj_player.x, obj_player.y);
		speed = hsp;
	}
}



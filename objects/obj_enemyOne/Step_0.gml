if (instance_exists(obj_player_old))
{
	//check if player is in range
	if (distance_to_object(obj_player_old) < attack_range)
	{
		//break from path
		path_end();
		
		//direct towrards play pos.
		direction = point_direction(x,y,obj_player_old.x, obj_player_old.y);
		speed = hsp;
	}
}



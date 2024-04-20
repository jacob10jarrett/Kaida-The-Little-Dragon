if (instance_exists(obj_player))
{
	//check if player is in range
	if (distance_to_object(obj_player) < attackRange)
	{		
		aggro = true;
	}
}

if (aggro == true)
{
	if (obj_player.x > x)
	{
		hsp = 2;
	}
	if (obj_player.x < x)
	{
		hsp = -2;
	}
}

vsp += grvt;

// Horizontal collision with obj_block or obj_wall or obj_crate or obj_MovingPlatform or obj_MovingAirPlatform
if (place_meeting(x+hsp, y, obj_block))
{
	vsp = - 7
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y+vsp, obj_block))
{
    vsp = 0;
}
y += vsp;






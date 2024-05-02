

vsp += grvt;

if (place_meeting(x, y+vsp, obj_block))
{
	while (!place_meeting(x,y+sign(vsp), obj_block) && !place_meeting(x,y+sign(vsp), obj_wall) && 
		!place_meeting(x,y+sign(vsp), obj_crate) && !place_meeting(x,y+sign(vsp), obj_MovingAirPlatform) && 
		!place_meeting(x,y+sign(vsp), obj_PressurePlate2)) 
	{
        y += sign(vsp);
    }
	
	
    vsp = 0;
	alarm[0] = 5
}

y += vsp;
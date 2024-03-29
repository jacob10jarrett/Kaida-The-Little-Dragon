hsp = 0;
vsp = 0;
grvt = 0.3;
walkspeed = 8;
jumpHeight = 13;

falling = false;
idle = true;
canDash = false;
dashDist = 250;
dashTime = 15;

StateFree = function()
{
		{																	/* base movement */
	var moving = key_right - key_left;
	hsp = moving * walkspeed;
	vsp = vsp + grvt;
	}
	if (place_meeting(x,y+1,obj_block)) && (key_jump)							  /* jumping */
	{
		instance_create_layer(x,y+50,"Assets", obj_effect_jump);
		vsp -= jumpHeight;
	}

	if (canDash == true) && (key_dash)
	{
		canDash = false;
		dashDirection = point_direction(0, 0, key_right - key_left, key_down - key_up);
		dashSpeed = dashDist/dashTime;
		dashEnergy = dashDist;
		state = StateDash;
	}

	if (place_meeting(x+hsp, y, obj_block))									/* horizontal collision */
	{
		while (!place_meeting(x+sign(hsp),y, obj_block))
	{
		x = x + sign(hsp);
	}
		hsp = 0;
	}
	x = x + hsp;

	if (place_meeting(x, y+vsp, obj_block))									/* vertical collision */
	{
		while (!place_meeting(x,y+sign(vsp), obj_block))
		{
			y = y + sign(vsp);
			canDash = true;
		}
		vsp = 0;
		sprite_index = spr_player_idle;
	}
	y = y + vsp;

	/*-------------------------------------------ANIMATIONS----------------------------------------------------*/	
	if (vsp > 0 || vsp < 0)
	{
		idle = false;
		falling = true;
	}

	if (hsp != 0)															  /* Sprite direction */
	{
		image_xscale=(sign(hsp));
	}

	if (!place_meeting(x,y+1,obj_block))									       /* fly Anim */
	{
		sprite_index = spr_player_fly;
		if (sign(vsp) > 0 || sign(vsp) < 0)
		{
			sprite_index = spr_player_fly; 
		}
		else 
		{
			sprite_index = spr_player_idle;
		}
	}
	else 
		if (hsp == 0)														      /* idle Anim */
		{
			sprite_index = spr_player_idle
		}
		else																      /* walk Anim */
		{
			idle = false;
			sprite_index = spr_player_walk;
		}
	}

StateDash = function()															    /* dash */
{
	sprite_index = spr_player_dash										          /* dash Anim*/
	hsp = lengthdir_x(dashSpeed, dashDirection);
	vsp = lengthdir_y(dashSpeed, dashDirection);
	
	with (instance_create_depth(x,y,depth+1, obj_dashTrail))					  /* dash trail*/
	{
		sprite_index = other.sprite_index;
		image_blend = c_ltgray;
		image_alpha = .7;
	}
	
	if (place_meeting(x+hsp, y, obj_block))								/* horizontal collision */
	{
		while (!place_meeting(x+sign(hsp),y, obj_block))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	if (place_meeting(x, y+vsp, obj_block))								/* vertical collision */
	{
		while (!place_meeting(x,y+sign(vsp), obj_block))
		{
			y = y + sign(vsp);
			//canDash = true;
		}
		vsp = 0;
		sprite_index = spr_player_idle;
	}
	y = y + vsp;
	
	dashEnergy -= dashSpeed;
	if (dashEnergy <= 0)
	{
		vsp = 0;	
		hsp = 0;
		state = StateFree;													   /* revert state */
	}
}

state = StateFree;
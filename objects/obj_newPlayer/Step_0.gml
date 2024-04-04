
	{																		/* user input (1 or 0) */
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));			
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
	key_up = keyboard_check(vk_up)
	key_down = keyboard_check(vk_down)
	key_dash = keyboard_check_pressed(vk_shift)
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

if (state == 0)
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
		state = 1;
	}



	
	if (key_jump) && (place_meeting(x+1, y, obj_block) || place_meeting(x-1, y, obj_block))
	{
	vsp = -jumpHeight;

	}
	
	if (keyboard_check_pressed(ord("Z")))
	{
		state = 2;
	}
	

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

if (state == 1)																		/* dash */
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
	
	
	
	dashEnergy -= dashSpeed;
	if (dashEnergy <= 0)
	{
		vsp = 0;	
		hsp = 0;
		state = 0;													   /* revert state */
	}
}

if (state == 2)
{
	
	sprite_index = spr_player_sideAttack

	instance_create_layer(x,y,"player", obj_melee);
	
	alarm[0] = 5;
	state = 0;
}


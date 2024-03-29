	
	{																		/* user input (1 or 0) */
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));			
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
	}
									
	{																			/* base movement */
	var moving = key_right - key_left;
	hsp = moving * walkspeed;
	vsp = vsp + grvt;
	}
if (place_meeting(x,y+1,obj_block)) && (key_jump)							  /* jumping */
{
	vsp -= jumpHeight;
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

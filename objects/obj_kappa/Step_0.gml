if (instance_exists(obj_player))
{
	//proc aggro	
	if (distance_to_object(obj_player) < aggroRange)
	{		
		aggro = true;
		moving = true;
	}
	
	//break aggro
	if (distance_to_object(obj_player) > aggroRange + 200)
	{		
		aggro = false;
		moving = false;
	}
	
	//flip sprite
	if (obj_player.x > x && !attacking)
	{
		image_xscale = -1;
	}
	if (obj_player.x < x && !attacking)
	{
		image_xscale = 1
	}
	
	if (distance_to_object(obj_player) < attackRange && canAttack && !attacking)
	{		
		attacking = true;	
		canAttack = false;
		alarm[0] = 200;
		alarm[1] = 50;
		alarm[2] = 100;
	}
	
	if (attacking && canAttack)
	{
		canAttack = false;
		alarm[1] = 50;
		alarm[2] = 100;
	}
	
	if (swinging)
		{
			image_speed = 1;
			if (image_index == 4)
			{
				//image_speed = 0;
				swinging = false;
			}
		}
	
	if (attacking)
	{
		image_speed = 1;
		attacking = true; moving = false	hsp = 0;
		
		
		//stand up
		if (image_index == 4 && sprite_index == spr_kappaAwaken)
		{
			image_speed = 0;
			sprite_index = spr_kappaAttack;
		}
		
	}
	
}

if (aggro && !attacking && moving)
{
	if (obj_player.x > x)
	{
		hsp = 2;
		
		
		if (image_index != 0 && sprite_index != spr_kappaAwaken)
		{
			sprite_index = spr_kappaAwaken;
			image_index = 4;
			image_speed = -1;
		}
		if (image_index = 0) image_speed = 0;	image_index = 0;
	}
	if (obj_player.x < x)
	{
		hsp = -2;
		

		if (image_index != 0)
		{
			sprite_index = spr_kappaAwaken;
			image_index = 4;
			image_speed = -1;
		}
		if (image_index = 0) image_speed = 0;	image_index = 0; 
	}
}

vsp += grvt;

// Horizontal collision
if (place_meeting(x+hsp, y, obj_block))
{
	hsp = 0;
	if (canJump)
	{
		vsp = - 7
		canJump = false;
		alarm[3] = 60;
	}
}
x += hsp;

// Vertical collision
if (place_meeting(x, y+vsp, obj_block))
{
    vsp = 0;
}
y += vsp;

if (isHit)
{
	if (place_meeting(x, y + 1, obj_block))
	{
		isHit = false;
		hsp = 0;
		vsp = 0;
	}
}

if (hp <= 0) instance_destroy();






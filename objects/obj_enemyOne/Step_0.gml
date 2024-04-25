
if (instance_exists(obj_player))
{
	//proc aggro	
	if (distance_to_object(obj_player) < aggroRange)
	{		
		aggro = true;
		image_speed = 1;
	}
	
	//break aggro
	if (distance_to_object(obj_player) > aggroRange + 200)
	{		
		aggro = false;
		image_speed = 0;
	}
	
	//flip sprite
	if (obj_player.x > x)
	{
		image_xscale = -1;
	}
	if (obj_player.x < x)
	{
		image_xscale = 1
	}
	
	//pause and attack
	if (distance_to_object(obj_player) < attackRange && canAttack)
	{		
		
		attacking = true;
		canAttack = false;
		hsp = 0;
		alarm[0] = 100;
		alarm[1] = 20;
		alarm[2] = 70;
		
	}
}

if (aggro && !attacking)
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









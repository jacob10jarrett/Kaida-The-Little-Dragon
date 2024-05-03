
if (y < 200)	
{
	canFire = true;
	sprite_index = spr_finalBossFlying;
	image_speed = .5;
}
if (y >=  200)	
{
	canFire = false;
	
	if (y >= 700)
	{
		sprite_index = spr_finalBossBiting;
		image_speed = .35;
	}
}


if (canFire && justFired == false)	
{
	show_debug_message("firing");	
	
	var bullet = instance_create_layer(x, y, "Instances", o_bossFireBall);
	with (bullet)
	{
		direction = point_direction(x, y, obj_player.x, obj_player.y);
		bullet.speed = 10;	
	}
	justFired = true;

	
	alarm[0] = room_speed * 1/3;
}

if (!canFire && justBit = false)	
{
	show_debug_message("NOT FIRING");
	
	if (x < obj_player.x) 
	{
		instance_create_layer(x+155,y+20,"Instances", obj_finalBossMelee);
	}
	
	if (x > obj_player.x) 
	{
		instance_create_layer(x-155,y+20,"Instances", obj_finalBossMelee);
	}

	
	alarm[1] = 104;
	justBit = true;
}

if (x < obj_player.x)	image_xscale = 3

if (x > obj_player.x)	image_xscale = -3;	

if (hp <= 0)

{

	imageGone = true
}

if(imageGone)
{
	image_alpha  -= 0.01
	if image_alpha <= 0
	instance_destroy()
	
}






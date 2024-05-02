
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


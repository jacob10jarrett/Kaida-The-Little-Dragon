hsp = 0;
vsp = 0;
grvt = 0.3;
walkspeed = 8;
jumpHeight = 10;

falling = false;
idle = true;
canDash = false;
dashDist = 250;
dashTime = 15;


enum states
{
	free, dash, melee
}

state = 0;
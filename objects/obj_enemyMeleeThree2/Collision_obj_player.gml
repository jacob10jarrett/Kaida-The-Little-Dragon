/// @description Insert description here
other.isStaggered = true;
other.state = 5;

if (other.isHit == false) 
{
	obj_player.hp -=1;
	other.isHit = true;
}

if (x < other.x)
{
	other.hsp = 6;
}

if (x > other.x)
{
	other.hsp = -6;
}

isFlashing = true;
flash_timer = flash_duration;

//other.hsp = sign(image_index) * 6;


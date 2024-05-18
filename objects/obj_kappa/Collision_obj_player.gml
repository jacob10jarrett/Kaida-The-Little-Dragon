image_speed = 1
other.isStaggered = true;
other.state = 5;

if (other.isHit == false) 
{

	global.hp -=1;
	other.isHit = true;
	audio_play_sound(snd_hit,1,false)
}

if (x < other.x)
{
	other.hsp = 3;
}

if (x > other.x)
{
	other.hsp = -3;
}
//other.hsp = sign(image_index) * 6;





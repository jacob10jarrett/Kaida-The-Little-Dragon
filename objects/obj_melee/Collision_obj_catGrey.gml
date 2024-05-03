other.vsp = -4;


if (x < other.x)
{
	other.hsp = 6;
}

if (x > other.x)
{
	other.hsp = -6;
}


if (other.isHit == false) 
{
	audio_play_sound(snd_cat,1,false)
	other.hp -=34;
	other.isHit = true;
}

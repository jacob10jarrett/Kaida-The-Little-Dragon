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
	audio_play_sound(snd_kasa,1,false)
	other.hp -=51;
	other.isHit = true;
}

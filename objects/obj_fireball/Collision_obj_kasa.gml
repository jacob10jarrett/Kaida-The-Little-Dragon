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
	other.hp -=34;
	other.isHit = true;
}

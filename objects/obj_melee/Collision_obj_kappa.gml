other.vsp = -4;


if (x < other.x)
{
	other.hsp = 4;
}

if (x > other.x)
{
	other.hsp = -4;
}


if (other.isHit == false) 
{
	other.hp -=1;
	other.isHit = true;
}
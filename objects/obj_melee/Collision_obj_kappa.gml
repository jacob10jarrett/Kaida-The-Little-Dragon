
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
		if(other.sprite_index = spr_kappaAwaken && other.image_index = 0)
		other.hp -= 0;
		else
		other.hp -=31;
		other.isHit = true;
	}

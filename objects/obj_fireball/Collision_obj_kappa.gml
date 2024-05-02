
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
		{
		other.hp -= 34;
		other.awake = true
		other.image_speed = 1
		}
		else
		{
		other.hp -=51;
		other.isHit = true;
		}
	}
instance_destroy()



/// @description timer for swing

if (sign(image_xscale) < 0)
	{
		instance_create_layer(x + 50 ,y,"Player", obj_enemyMeleeTwo);
	}
	else instance_create_layer(x - 50 ,y,"Player", obj_enemyMeleeTwo);
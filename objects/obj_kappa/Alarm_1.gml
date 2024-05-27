/// @description timer for swing

swinging = true;

if (sign(image_xscale) < 0)
	{
		instance_create_layer(x + 50 ,y,"Player", obj_kappaMelee);
	}
	else instance_create_layer(x - 50 ,y,"Player", obj_kappaMelee);

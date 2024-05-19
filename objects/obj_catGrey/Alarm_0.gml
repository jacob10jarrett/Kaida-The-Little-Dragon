if (aggro)
{
    var fire;
    if (facing_right)
    {
        fire = instance_create_layer(x+50, y-10, "VisibleObjects", obj_catFire);
    }
    else
    {
        fire = instance_create_layer(x-50, y-10, "VisibleObjects", obj_catFire);
    }
    array_push(fire_instances, fire);
}
alarm[0] = 100;

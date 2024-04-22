if (!activated)
{
    with (obj_MovingPlatform3)
    {
        pp_vertical_speed = -2; 
        alarm[0] = room_speed * 3; 
    }

    activated = true;
}

if (!activated)
{
    with (obj_PressurePlate2)
    {
        pp_vertical_speed = -2; 
        alarm[3] = room_speed * 3; 
    }

    activated = true;
}

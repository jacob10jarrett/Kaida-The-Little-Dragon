if (!activated)
{
    with (obj_MovingPlatform)
    {
        vertical_speed = -2; 
        alarm[0] = room_speed * 3; 
    }

    activated = true;
}
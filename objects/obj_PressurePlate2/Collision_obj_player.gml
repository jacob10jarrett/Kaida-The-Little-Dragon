if (!activated)
{
    with (obj_MovingPlatform2)
    {
        vertical_speed = -2; 
        alarm[0] = room_speed * 3; 
    }

    activated = true;
}
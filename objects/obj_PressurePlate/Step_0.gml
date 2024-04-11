var playerAbove = instance_place(x, y - 1, obj_player);

if (playerAbove && !activated)
{
    with (obj_MovingPlatform)
    {
        vertical_speed = -2; 
        alarm[0] = room_speed * 2.2;
    }

    activated = true;
}
else if (!playerAbove && activated)
{
    activated = false;
}
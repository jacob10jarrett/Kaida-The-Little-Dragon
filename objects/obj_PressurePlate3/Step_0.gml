var playerAbove = instance_place(x, y - 1, obj_player);

if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform3) {
        vertical_speed = -4;
        alarm[0] = room_speed * 3; 
    }
    activated = true;
    canBeActivated = false; 
    alarm[2] = room_speed * 3; 
} 
else if (!playerAbove && activated) {
    activated = false;
}

if (playerAbove && !activated && canBeActivated) {
    with (obj_PressurePlate2) {
        pp_vertical_speed = -4;
        alarm[3] = room_speed * 3; 
    }
} 
var playerAbove = instance_place(x, y - 1, obj_player);

if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform2) {
        vertical_speed = -4;
        alarm[0] = room_speed * 4; 
    }
    activated = true;
    canBeActivated = false; 
    alarm[2] = room_speed * 5; 
} 
else if (!playerAbove && activated) {
    activated = false;
}


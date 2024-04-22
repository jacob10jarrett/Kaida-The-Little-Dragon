y += pp_vertical_speed;

var playerAbove = instance_place(x, y - 1, obj_player);

if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform2) {
        vertical_speed = 4;
        alarm[0] = room_speed * 9.2; 
    }
    activated = true;
    canBeActivated = false; 
    alarm[2] = room_speed * 9.2; 
} 
else if (!playerAbove && activated) {
    activated = false;
}

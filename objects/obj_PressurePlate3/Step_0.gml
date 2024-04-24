var playerAbove = instance_place(x, y - 1, obj_player);

if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform3) {
        vertical_speed = -4;
        alarm[0] = 180; 
    }
    activated = true;
	audio_play_sound(snd_pressureplate, 0, 0)
    canBeActivated = false; 
    alarm[2] = 360; 
} 
else if (!playerAbove && activated) {
    activated = false;
}

if (playerAbove && !activated && canBeActivated) {
    with (obj_PressurePlate2) {
        pp_vertical_speed = -4;
        alarm[3] = 180; 
    }
} 
var playerAbove = instance_place(x, y - 12, obj_player);

if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform) {
        vertical_speed = -3;
        alarm[0] = 120; 
    }
    activated = true;
	audio_play_sound(snd_pressureplate, 0, 0)
    canBeActivated = false; 
    alarm[2] = 240; 
} 
else if (!playerAbove && activated) {
    activated = false;
}


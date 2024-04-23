var playerAbove = instance_place(x, y - 1, obj_player);

if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform) {
        vertical_speed = -2;
        alarm[0] = room_speed * 2; 
    }
    activated = true;
	audio_play_sound(snd_pressureplate, 0, 0)
    canBeActivated = false; 
    alarm[2] = room_speed * 4; 
} 
else if (!playerAbove && activated) {
    activated = false;
}


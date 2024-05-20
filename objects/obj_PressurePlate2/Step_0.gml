y += pp_vertical_speed;

if (activated) {
    y = obj_MovingPlatform2.y - sprite_height;
}

var playerCheck = instance_place(x, y - 1, obj_player);

if (playerCheck) {
    playerAbove = true;
} else {
    playerAbove = false;
}

if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform2) {
        if (!moving) { 
            vertical_speed = 4;
            alarm[0] = 540;
            soundPlayed = false; 
        }
    }
    activated = true;
    canBeActivated = false;

    if (!soundPlayed) { 
        if (!audio_is_playing(snd_pressureplate) && !audio_is_playing(snd_rumble)) {
            audio_play_sound(snd_pressureplate, 0, false);
        }
        audio_play_sound(snd_rumble, 0, 0.1, 1, false);
        soundPlayed = true; 
    }

    alarm[2] = 1080;
}

if (!playerAbove && !activated && y != initial_y) {
    y = initial_y;
    x = initial_x;
}

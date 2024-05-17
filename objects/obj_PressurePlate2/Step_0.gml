y += pp_vertical_speed;

if (activated) {
    y = obj_MovingPlatform3.y - sprite_height;
}

// Check if the player is directly above the plate
var playerCheck = instance_place(x, y - sprite_height / 2, obj_player);

if (playerCheck) {
    playerAbove = true;
} else {
    playerAbove = false;
}

if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform2) {
        vertical_speed = 4;
        alarm[0] = 540;
    }
    activated = true;
    canBeActivated = false;

    if (!audio_is_playing(snd_pressureplate)) {
        audio_play_sound(snd_pressureplate, 0, false);
    }
    audio_play_sound(snd_rumble, 0, 0.1, 1, false);
    alarm[2] = 1080;
}


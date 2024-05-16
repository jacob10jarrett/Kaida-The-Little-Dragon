y += pp_vertical_speed;

if (activated) {
    y = obj_MovingPlatform3.y - sprite_height; 
}

var playerAbove = instance_place(x, y - 1, obj_player);
if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform2) {
        vertical_speed = 4; 
        alarm[0] = 540;
    }
    activated = true;
    canBeActivated = false;
	audio_play_sound(snd_pressureplate, 0, false);
	audio_play_sound(snd_rumble, 0, 0.1, 1, false);
    alarm[2] = 1080;
} else if (playerAbove && activated) {
    activated = true;
}

if (!playerAbove && activated) {
    alarm[3] = 15;
}
y += pp_vertical_speed;

if (activated) {
    // Adjust the pressure plate's position directly based on the platform's movement
    y = obj_MovingPlatform3.y - sprite_height; // sprite_height should be the height of the pressure plate sprite
}

var playerAbove = instance_place(x, y - 12, obj_player);
if (playerAbove && !activated && canBeActivated) {
    with (obj_MovingPlatform2) {
        vertical_speed = 4; 
        alarm[0] = 540;
    }
    activated = true;
    audio_play_sound(snd_pressureplate, 0, false);
    canBeActivated = false;
    alarm[2] = 1080;
}
else if (!playerAbove && activated) {
    activated = false;
}


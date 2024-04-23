// Assuming pp_vertical_speed is the speed at which the pressure plate moves vertically
y += pp_vertical_speed;

var playerAbove = instance_place(x, y - 12, obj_player);
if (playerAbove && !activated && canBeActivated) {
    // Assume obj_MovingPlatform2 is the moving platform controlled by this plate
    with (obj_MovingPlatform2) {
        vertical_speed = -4;
        alarm[0] = 540;  // Adjust as necessary
    }
    activated = true;
    audio_play_sound(snd_pressureplate, 0, false);
    canBeActivated = false;
    alarm[2] = 540;
}


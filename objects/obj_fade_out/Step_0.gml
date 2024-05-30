if (fading_out) {
    fade_alpha += 0.01;
    if (fade_alpha >= 1) {
        fade_alpha = 1;
        room_goto(rm_mountain_to_kitsune_text);
    }
}
if (global.trigger_mountain_cutscene) {
    frame_index += frame_speed;
    if (frame_index >= max_frames) {
        frame_index = max_frames; 
        is_fading_out = true; 
    }
}

if (is_fading_out) {
    alpha_value -= fade_speed;
    alpha_value = max(alpha_value, 0);
    if (alpha_value <= 0) {
        is_fading_out = false;
        global.trigger_mountain_cutscene = false;
        obj_player.can_control = true;
        instance_destroy();
    }
}
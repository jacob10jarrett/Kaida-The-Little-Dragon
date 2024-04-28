if (global.trigger_mountain_cutscene) {
    frame_index += frame_speed;
    if (frame_index >= max_frames) {
        frame_index = max_frames; 
		instance_destroy();
    }
}
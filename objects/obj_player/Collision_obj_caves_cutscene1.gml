can_control = false;
rotating_cutscene_caves = true;

if (!cave_cutscene_sound_played) {
    audio_play_sound(snd_trapdoor, 1, false);
    cave_cutscene_sound_played = true; 
	audio_play_sound(snd_song6, 1, true);
	audio_sound_gain(snd_song5, 0, 500)
}

path_start(path_1, 1, path_action_stop, false);

if (rotating_cutscene_caves) {
    image_angle += -1;
    if (image_angle >= -2) { 
        rotating_cutscene_caves = false;
    }
}
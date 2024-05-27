for (var i = 0; i < array_length(texts); i++) {
    if (i > 0 && fade_stages[i - 1] < 2) {
        continue;
    }
    
    if (fade_stages[i] < 2) {
        step_counts[i]++;
        if (fade_stages[i] == 0) {
            var length = min(floor(step_counts[i] / fade_steps[i]), string_length(texts[i]));
            current_texts[i] = string_copy(texts[i], 1, length);

            if (length == string_length(texts[i])) {
                if (step_counts[i] >= string_length(texts[i]) * fade_steps[i] + text_display_time) {
                    fade_stages[i] = 1;
                    step_counts[i] = 0;
                }
            }
        } else if (fade_stages[i] == 1) {
            if (step_counts[i] >= delay_between_texts) {
                fade_stages[i] = 2;
                step_counts[i] = 0;
            }
        }
    }
}

if (fade_stages[array_length(texts) - 1] == 2) {
    fade_alpha += 1 / text_fade_time;
	audio_sound_gain(snd_nature2, 0, 180)
    if (fade_alpha >= 1) {
        room_goto_next(); 
    }
}

if (delay_counter < delay_duration) {
    delay_counter++;
} else {
    if (!sound_played) {
        audio_play_sound(snd_song10, 1, false);
        sound_played = true;
    }
    if (!fade_out_all) {
        for (var i = 0; i < array_length(texts) - 1; i++) {
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

        if (fade_stages[array_length(texts) - 2] == 2) {
            fade_out_all = true;
            step_counts = array_create(array_length(texts), 0);
            fade_alpha = 0;
        }
    } else if (!show_the_end) {
        fade_alpha += 1 / text_fade_time;
        if (fade_alpha >= 1) {
            fade_alpha = 1;
            for (var i = 0; i < array_length(texts) - 1; i++) {
                current_texts[i] = "";
            }
            show_the_end = true;
            fade_alpha = 0;  
        }
    } else if (!final_fade) {
        var length = min(floor(step_counts[array_length(texts) - 1] / fade_steps[array_length(texts) - 1]), string_length(texts[array_length(texts) - 1]));
        current_texts[array_length(texts) - 1] = string_copy(texts[array_length(texts) - 1], 1, length);
        step_counts[array_length(texts) - 1]++;
        
        if (current_texts[array_length(texts) - 1] == texts[array_length(texts) - 1]) {
            the_end_display_time--;
            if (the_end_display_time <= 0) {
                final_fade = true;
                fade_alpha = 0;  
            }
        }
    } else {
        fade_alpha += 1 / text_fade_time;
        if (fade_alpha >= 1) {
            fade_alpha = 1;
            room_goto_next(); 
        }
    }
}


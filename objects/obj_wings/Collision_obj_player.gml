image_alpha = 0

if (!alreadyTriggered && room = rm_kitsune) {
    if (!audio_is_playing(snd_jump)) {
        audio_play_sound(snd_jump, 1, false);
    }

    showText = true;
    alreadyTriggered = true; 
}
other.firebreathUnlocked = true;
if (!alreadyTriggered) {
    if (!audio_is_playing(snd_fire)) {
        audio_play_sound(snd_fire, 1, false);
        alarm[0] = room_speed * 2; 
    }

    showText = true;
    alarm[1] = room_speed * 2; 

    alreadyTriggered = true; 
}
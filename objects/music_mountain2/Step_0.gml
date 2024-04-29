var distance = point_distance(x, y, obj_player.x, obj_player.y);

if (distance <= 300 && !sound_played)
{
    // Adjust sound gain for snd_song8
    audio_sound_gain(snd_song8, 0, 2500);
    //audio_sound_gain(snd_wind, 0, 500);
    audio_play_sound(snd_song9, 1, true);
    sound_played = true; 
}
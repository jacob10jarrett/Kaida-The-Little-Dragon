var distance = point_distance(x, y, obj_player.x, obj_player.y);

if (distance <= 300 && !sound_played)
{
    audio_sound_gain(snd_song8, 0, 2500);
    audio_play_sound(snd_song9, 1, true);
    sound_played = true; 
}
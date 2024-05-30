start_y -= scroll_speed; 

if (start_y < -array_length(credits) * string_height("A") * 8) {
    audio_sound_gain(snd_song10, 0, 1000)
	room_goto_next()
}

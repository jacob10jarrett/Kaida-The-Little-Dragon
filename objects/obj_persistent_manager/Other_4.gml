// If we're in the end room
if (room == rm_end)
{
	// Play music track with looping enabled
	audio_play_sound(snd_song1, 0, 1);
}
if (file_exists("checkpoint.ini"))

{
	
	file_delete("checkpoint.ini");
}
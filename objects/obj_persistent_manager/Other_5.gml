// Stop the main music track
// If you have other music tracks that may play, stop them here
audio_stop_sound(snd_song1);

if (file_exists("checkpoint.ini"))

{
	
	file_delete("checkpoint.ini");
}
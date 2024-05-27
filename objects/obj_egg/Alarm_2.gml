broken = true;
audio_stop_sound(snd_egg)
audio_play_sound(snd_pop, 1, false)
obj_player.jumped_out = false;  
obj_player.visible = true;
obj_player.vsp = -10;  
//alarm[3] = 120;
function fade_out_sound(){
var sound_id = argument0;
var fade_time = argument1;
var fade_steps = fade_time * room_speed;
global.sound_fade_step = global.snd_prologue_volume / fade_steps;
global.sound_fade_id = sound_id;
alarm[0] = 1;
}
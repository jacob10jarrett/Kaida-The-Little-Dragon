y = y + sin(current_time * frequency) * amplitude;
var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

if (distance_to_player <= 1650) {
    if (obj_player.hsp > 0) { 
        hsp = 0.8 * obj_player.hsp;
    } else {
        hsp = 0; 
    }
} else {
    hsp = 0; 
}
x += hsp;

if (distance_to_player <= 500 && !cutscene_triggered) {
    global.trigger_caves_cutscene = true;
    cutscene_triggered = true;
    alarm[1] = room_speed * 2;  
    audio_play_sound(snd_horror, 1, false);
}

if (distance_to_player > 1000) {
    cutscene_triggered = false; 
}
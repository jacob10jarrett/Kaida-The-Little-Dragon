var all_correct = true;

var pos_puzzle1 = instance_position(14496, 12992, obj_dpuzzle1);
var pos_puzzle2 = instance_position(14624, 12992, obj_dpuzzle2);
var pos_puzzle3 = instance_position(14752, 12992, obj_dpuzzle3);
var pos_puzzle4 = instance_position(14496, 13120, obj_dpuzzle4);
var pos_puzzle5 = instance_position(14624, 13120, obj_dpuzzle5);
var pos_blank = instance_position(14752, 13120, obj_blank);

if (!pos_puzzle1 || !pos_puzzle2 || !pos_puzzle3 || !pos_puzzle4 || !pos_puzzle5 || !pos_blank) {
    all_correct = false;
}

if (all_correct) {
	screenshake(30, 5, 0.2);
    audio_play_sound(snd_rumble, 100, false);  
    alarm[0] = room_speed * 2;  

    with (obj_puzzlePlatform) {
        if (y < 13344) {
            y += 4;
        }
    }
} else {
    if (audio_is_playing(snd_rumble)) {
        audio_stop_sound(snd_rumble);
    }
}


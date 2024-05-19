if (global.hp < global.max_hp) {
    global.hp += 1;
} else if (global.hp == global.max_hp && global.max_hp < 10) {
    global.max_hp += 1;
    global.hp = global.max_hp;
}

audio_play_sound(snd_heart, 1, false)
instance_destroy();
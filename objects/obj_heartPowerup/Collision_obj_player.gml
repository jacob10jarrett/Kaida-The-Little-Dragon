if (global.hp < global.max_hp) {
    global.hp += 1;
} else if (global.hp == global.max_hp && global.max_hp < 10) {
    global.max_hp += 1;
    global.hp = global.max_hp;
}

instance_destroy();
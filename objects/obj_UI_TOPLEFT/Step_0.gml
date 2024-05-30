global.previous_room = room;

if (global.dialogue_active) {
    global.showUI = false;
}

if (!global.dialogue_active) && room != rm_prologue {
    global.showUI = true;
}

if room = rm_intermission {
	global.showUI = false;
}



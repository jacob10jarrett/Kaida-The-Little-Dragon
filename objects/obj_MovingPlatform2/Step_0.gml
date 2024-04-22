y += vertical_speed;

if (vertical_speed > 0) {
    if (place_meeting(x, y + vertical_speed, obj_player)) {
        with (obj_player) {
            instance_destroy(); 
        }
		
        global.gameState = "gameOver"; 
		room_goto(rm_gameOver);
    }
}
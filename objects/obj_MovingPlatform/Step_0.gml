
y += vertical_speed;

// Then, check for collision with obj_player if the platform is moving downwards
if (vertical_speed > 0) { 
    if (place_meeting(x, y, obj_player)) {
        // Destroy the player and handle game over scenario
        with (obj_player) {
            instance_destroy(); 
        }
        global.gameState = "gameOver"; 
        room_goto(rm_gameOver);
    }
}


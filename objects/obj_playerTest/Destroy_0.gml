audio_play_sound(snd_kill_character, 1, false);
room_restart();

global.lives -= 1;
if (global.lives <= 0) {
    // Trigger game over functionality
    global.game_over = true;
    // Additional game over logic here (e.g., navigate to a game over screen)
} else {
    // Restart the room or respawn the player as needed
    room_restart(); // Example action
}




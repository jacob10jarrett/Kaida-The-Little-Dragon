// Check if the player is moving downwards and is above the enemy
if (vspeed > 0 && y < other.y) {
    // Successful jump on the enemy, bounce the player
    vspeed = -vspeed; // Adjust this value as needed to control the bounce height
    
    // Destroy the enemy
    instance_destroy(other);
} else {
    // Player collides with the enemy without jumping on it successfully, destroy the player
    instance_destroy();
}




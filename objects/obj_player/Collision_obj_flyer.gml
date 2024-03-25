// Check if the player is moving downwards and is above the enemy
if (vspeed > 0 && y < other.y) {
    // Successful jump on the enemy, bounce the player
    vspeed = -vspeed; 
    
    instance_destroy(other);
} else {

    instance_destroy();
}




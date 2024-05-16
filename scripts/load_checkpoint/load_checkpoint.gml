function load_checkpoint() {
    // Open the INI file where checkpoint data is stored
    ini_open("checkpoint.ini");

    // Read the last saved checkpoint position and health
    var checkpoint_x = ini_read_real("checkpoint", "x", 100); // Default x if not found
    var checkpoint_y = ini_read_real("checkpoint", "y", 100); // Default y if not found
    var player_hp = ini_read_real("player", "hp", 10); // Default health if not found

    // Close the INI file after reading
    ini_close();

    // Check if the player instance exists
    if (!instance_exists(obj_player)) {
        // If the player does not exist, create it at the checkpoint or default position
        var player_instance = instance_create_layer(checkpoint_x, checkpoint_y, "Instances", obj_player);
        show_debug_message("Player created at checkpoint: X=" + string(checkpoint_x) + ", Y=" + string(checkpoint_y));
    } else {
        // If the player exists, just update its position and health
        var player_instance = instance_find(obj_player, 0);
        player_instance.x = checkpoint_x;
        player_instance.y = checkpoint_y;
        show_debug_message("Player moved to checkpoint: X=" + string(checkpoint_x) + ", Y=" + string(checkpoint_y));
    }

    // Set player health
    player_instance.hp = player_hp;
    show_debug_message("Player health set to: " + string(player_hp));
}


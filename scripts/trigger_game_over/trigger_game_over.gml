function trigger_game_over() {
    
    // Deactivate all instances except for the UI, which will show game over buttons
    instance_deactivate_all(true);
    
    // Get the ID of the 'GameOver' layer
    var game_over_layer_name = "GameOver";
    var game_over_layer = layer_get_id(game_over_layer_name);
    
    // Make sure the 'GameOver' layer exists
    if (game_over_layer == -1) {
        show_debug_message("GameOver layer not found.");
        return;
    }
    
    // Set the 'GameOver' layer to be visible
    layer_set_visible(game_over_layer, true);
    
    // Calculate the center position for the buttons using the viewport size
    var viewport_center_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
    var viewport_center_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;
    
    // Calculate positions for the buttons
    var checkpoint_button_y = viewport_center_y - 32; 
    var menu_button_y = viewport_center_y + 32; 
    
    // Create the buttons
    var checkpoint_button = instance_create_layer(viewport_center_x, checkpoint_button_y, game_over_layer_name, obj_button_checkpoint);
    var menu_button = instance_create_layer(viewport_center_x, menu_button_y, game_over_layer_name, obj_button_menu);
    
    // Center the buttons based on their sprite width
    checkpoint_button.x -= sprite_get_width(checkpoint_button.sprite_index) / 2;
    menu_button.x -= sprite_get_width(menu_button.sprite_index) / 2;

    // Optionally, you can start the sequence here if it's not auto-playing
    // var seq_id = layer_sequence_create(game_over_layer, x, y, seq_dead);
    // layer_sequence_play(seq_id);

    show_debug_message("Game Over - buttons created.");
}


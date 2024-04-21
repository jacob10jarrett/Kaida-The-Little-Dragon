function trigger_game_over() {
    // Check if the sequence asset exists
    if (!sequence_exists(seq_dead)) {
        show_debug_message("Sequence asset 'seq_dead' not found.");
        return; // Exit the function if the asset is missing
    }

    // Deactivate or hide all layers except 'GameOver'
    var all_layers = layer_get_all();
    for (var i = 0; i < array_length_1d(all_layers); i++) {
        if (layer_get_name(all_layers[i]) != "GameOver") {
            layer_set_visible(all_layers[i], false);
        }
    }

    // Create the sequence on the correct layer
    var layer_name = "GameOver";
    var seq_id = layer_sequence_create(layer_name, view_xview[0], view_yview[0], seq_dead);

    // Set the sequence to cover the full viewport
    layer_sequence_x(seq_id, view_xview[0]);
    layer_sequence_y(seq_id, view_yview[0]);
    layer_sequence_play(seq_id);

}
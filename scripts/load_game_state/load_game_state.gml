function load_game_state() {
    if (file_exists("savegame.ini")) {
        ini_open("savegame.ini");
        var px = ini_read_real("player", "x", room_width / 2);
        var py = ini_read_real("player", "y", room_height / 2);
        var php = ini_read_real("player", "hp", 100);
        var last_checkpoint_id = ini_read_real("game", "last_checkpoint", -1);
        ini_close();

        if (last_checkpoint_id != -1) {
            var checkpoint = instance_find(obj_saveSpot, last_checkpoint_id);
            if (checkpoint != noone) {
                px = checkpoint.x;
                py = checkpoint.y;
            } else {
                show_debug_message("Checkpoint instance not found, respawning at default location.");
            }
        } else {
            show_debug_message("No checkpoint data found, respawning at default location.");
        }

        if (!instance_exists(obj_player)) {
            var player_instance = instance_create_layer(px, py, "Instances", obj_player);
        } else {
            obj_player.x = px;
            obj_player.y = py;
            obj_player.hp -= 1;
        }

    } else {
        show_debug_message("Save file not found, respawning at default location.");
    }
}
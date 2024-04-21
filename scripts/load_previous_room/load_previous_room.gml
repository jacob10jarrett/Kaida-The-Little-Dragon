function load_previous_room() {
    if (file_exists("savegame.ini")) {
        ini_open("savegame.ini");
        var px = ini_read_real("player", "x", room_width / 2);
        var py = ini_read_real("player", "y", room_height / 2);
        var php = ini_read_real("player", "hp", 3);
        var saved_room = ini_read_string("game", "room", "");

        ini_close();

        if (saved_room != "") {
            show_debug_message("Loading room from save: " + saved_room);
            var room_index = asset_get_index(saved_room);
            if (room_exists(room_index)) {
                if (!instance_exists(obj_player)) {
                    var player_instance = instance_create_layer(px, py, "Instances", obj_player);
                    player_instance.hp = php;
                } else {
                    obj_player.x = px;
                    obj_player.y = py;
                    obj_player.hp = php;
                }
                room_goto(room_index);
            } else {
                show_debug_message("Room not found, staying in current room.");
            }
        } else {
            show_debug_message("No room saved, staying in current room.");
        }
    } else {
        show_debug_message("Save file not found, staying in current room.");
    }
}

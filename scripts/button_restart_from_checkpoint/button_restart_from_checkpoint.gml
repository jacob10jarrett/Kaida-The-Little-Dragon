function load_checkpoint() {
    ini_open("checkpoint.ini");
    var chk_type = ini_read_string("checkpoint", "type", "none");
    var chk_id = ini_read_real("checkpoint", "id", -1);
    var x = ini_read_real("checkpoint", "x", -1);
    var y = ini_read_real("checkpoint", "y", -1);
    var room = ini_read_real("checkpoint", "room", -1);
    ini_close();

    if (chk_type == "major" && chk_id != -1) {
        if (room_exists(room)) {
            room_goto(room);
            instance_create_layer(x, y, "Instances", obj_player);
            show_debug_message("Checkpoint loaded: X=" + string(x) + ", Y=" + string(y));
        } else {
            show_debug_message("Room does not exist.");
        }
    } else {
        show_debug_message("No valid checkpoint to load.");
        room_goto(rm_menu);  // Fallback to main menu
    }
}
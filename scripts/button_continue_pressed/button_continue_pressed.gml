function button_continue_pressed() {
    ini_open("checkpoint.ini");
    var checkpoint_type = ini_read_string("checkpoint", "type", "normal");
    var checkpoint_id = ini_read_real("checkpoint", "id", noone);

    if (checkpoint_type == "major" && instance_exists(checkpoint_id)) {
        var chk_instance = instance_find(obj_majorCheckpoint, 0); 
        if (chk_instance != noone) {
            room_goto(chk_instance.room); 
            with (obj_player) {
                x = chk_instance.x;
                y = chk_instance.y;
                hp = ini_read_real("player", "hp", 3); 
            }
        } else {
            room_goto(rm_menu);  
        }
    } else {
        room_goto(rm_menu);  
    }

    ini_close();
}
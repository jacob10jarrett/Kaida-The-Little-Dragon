function load_checkpoint() {

    ini_open("checkpoint.ini");

    var checkpoint_x = ini_read_real("checkpoint", "x", obj_player.x); 
    var checkpoint_y = ini_read_real("checkpoint", "y", obj_player.y); 
    var player_hp = ini_read_real("player", "hp", obj_player.hp); 

    ini_close();

    var player_instance = instance_find(obj_player, 0);
    if (instance_exists(player_instance)) {
        player_instance.x = checkpoint_x;
        player_instance.y = checkpoint_y;
        player_instance.hp = player_hp;
        show_debug_message("Player respawned at checkpoint: X=" + string(checkpoint_x) + ", Y=" + string(checkpoint_y) + ", HP=" + string(player_hp));
    } else {
        show_debug_message("Player instance not found.");
    }
}

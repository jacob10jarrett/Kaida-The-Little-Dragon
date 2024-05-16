function save_checkpoint(checkpoint) {
    ini_open("checkpoints.ini");
    ini_write_string("current_checkpoint", "type", checkpoint.checkpoint_type);
    ini_write_real("current_checkpoint", "id", checkpoint.checkpoint_id);
    ini_write_real("current_checkpoint", "x", checkpoint.position_x);
    ini_write_real("current_checkpoint", "y", checkpoint.position_y);
    ini_close();
    show_debug_message("Checkpoint saved: Type=" + checkpoint.checkpoint_type + ", ID=" + string(checkpoint.checkpoint_id));
}
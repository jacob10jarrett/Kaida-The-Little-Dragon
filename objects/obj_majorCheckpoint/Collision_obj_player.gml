// obj_majorCheckpoint - Collision Event with obj_player
ini_open("checkpoint.ini");

ini_write_string("checkpoint", "type", "major");
ini_write_real("checkpoint", "id", id);
ini_write_real("checkpoint", "x", x);
ini_write_real("checkpoint", "y", y);
ini_write_real("checkpoint", "room", room);
ini_write_real("player", "hp", obj_player.hp);

ini_close();

show_debug_message("Saving Checkpoint at: " + string(x) + ", " + string(y) + " with ID: " + string(id));


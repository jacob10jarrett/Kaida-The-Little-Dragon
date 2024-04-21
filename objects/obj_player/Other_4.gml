global.lastHP = hp;

if (file_exists("checkpoint.ini")) {
    ini_open("checkpoint.ini");
    x = ini_read_real("player", "x", x);
    y = ini_read_real("player", "y", y);
    hp = ini_read_real("player", "hp", 3);  // Ensure hp is being read correctly
    ini_close();
    show_debug_message("Loaded HP: " + string(hp));  // Debug message to confirm hp load
}

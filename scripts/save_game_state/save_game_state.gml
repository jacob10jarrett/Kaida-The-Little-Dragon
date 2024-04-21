function save_game_state() {
    ini_open("savegame.ini");
    ini_write_real("player", "x", obj_player.x);
    ini_write_real("player", "y", obj_player.y);
    ini_write_real("player", "hp", obj_player.hp);
    ini_write_string("game", "room", room_get_name(room)); 

    ini_close();
}

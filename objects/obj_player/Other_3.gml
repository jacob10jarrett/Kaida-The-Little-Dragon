ini_open("checkpoint.ini");
var checkpoint_type = ini_read_string("checkpoint", "type", "normal");

if (checkpoint_type == "major") {
    var player_x = ini_read_real("player", "x", room_width * 0.5);
    var player_y = ini_read_real("player", "y", room_height * 0.5);
    var player_hp = ini_read_real("player", "hp", 3); 
    
    room_restart();  
    with (obj_player) {
        x = player_x;
        y = player_y;
        hp = player_hp;
    }
} else {
    game_restart(); 
}

ini_close();

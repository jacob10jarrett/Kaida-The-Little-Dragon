y += vertical_speed;

if (instance_exists(obj_PressurePlate2)) {
    obj_PressurePlate2.y = y - obj_PressurePlate2.sprite_height + (obj_PressurePlate2.activated ? 8 : 0);
}

//if (vertical_speed < 0) {
//    if (place_meeting(x, y + vertical_speed, obj_player)) {
//        with (obj_player) {
//            instance_destroy(); 
//        }
//		
//        global.gameState = "gameOver"; 
//		room_goto(rm_gameOver);
//    }
//}
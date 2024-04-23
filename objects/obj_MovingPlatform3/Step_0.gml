y += vertical_speed;

if (instance_exists(obj_PressurePlate2)) {
    if (obj_PressurePlate2.activated) {
        obj_PressurePlate2.y = y - obj_PressurePlate2.sprite_height + 8;  
    } else {
        obj_PressurePlate2.y = y - obj_PressurePlate2.sprite_height; 
    }
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
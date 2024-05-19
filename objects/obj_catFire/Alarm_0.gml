if (obj_player.x < x) { 
    hspeed = -10;
    image_angle = -90;
}
if (obj_player.x > x) {
    hspeed = 10;
    image_angle = 90;
}

fired = true; 
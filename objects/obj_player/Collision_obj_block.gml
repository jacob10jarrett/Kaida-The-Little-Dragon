vspeed = 0;

while (place_meeting(x, y, obj_block)) {
    y -= 1;  // Move obj_player up pixel by pixel until no longer colliding
}



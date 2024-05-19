function flip_player(new_scale) {
    image_xscale = new_scale;
    check_and_fix_collision();
}

function check_and_fix_collision() {
    if (place_meeting(x, y, obj_block)) {
        if (!place_meeting(x - 64, y, obj_block)) {
            x -= 64;
        } 
        else if (!place_meeting(x + 64, y, obj_block)) {
            x += 64;
        }
    }
}
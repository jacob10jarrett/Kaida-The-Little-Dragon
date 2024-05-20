y += vertical_speed;

if (vertical_speed != 0) {
    moving = true;
} else {
    moving = false;
}

if (vertical_speed == 0 && !activated && (x != initial_x || y != initial_y)) {
    x = initial_x;
    y = initial_y;
}
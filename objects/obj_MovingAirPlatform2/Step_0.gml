if (moving_right) {
    x += hspd;
    if (x >= x_end) {
        moving_right = false;
		moving_left = true;
    }
} else {
    x -= hspd;
    if (x <= x_start) {
        moving_right = true;
		moving_left = false;
    }
}
y += vertical_speed;

if (instance_exists(obj_PressurePlate2)) {
    obj_PressurePlate2.y = y - 32;
}

if (!instance_exists(obj_PressurePlate2) && y != initial_y) {
    y = initial_y;
    x = initial_x; 
}

if (shaking) {
    image_angle = random_range(-5, 5); 
} else {
    image_angle = 0;
}

if (breaking) {
    sprite_index = spr_egg2broken;
} else if (!broken) {
    sprite_index = spr_egg2;
}
if (instance_exists(obj_player)) {
    for (var i = 0; i < obj_player.hp; i++) {
        draw_sprite(spr_heart, 0, (50 + 75 * i), 50);
    }
}
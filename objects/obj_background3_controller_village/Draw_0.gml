var _end = room_width / (sprite_get_width(sprite_index) * image_xscale);
for (var i = 0; i <= _end; i++) {
    var _x = x + i * sprite_get_width(sprite_index) * image_xscale;
    draw_sprite_ext(sprite_index, 0, _x, y, image_xscale, image_yscale, 0, c_white, 1);
}
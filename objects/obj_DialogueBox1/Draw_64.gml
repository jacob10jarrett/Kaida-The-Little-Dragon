// Calculate the position and size of the dialogue box
var box_width = display_get_width() * (1/3);
var box_height = display_get_height() * (1/3);
var box_x = (display_get_width() - box_width) / 2;
var box_y = display_get_height() * (1/9); // Centered in the top third

// Draw the background of the dialogue box
draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

// Draw the text
draw_set_font(font);
draw_set_color(c_white);
var text_margin = 10;
var text_width = box_width / 2 - text_margin * 2;
draw_text_ext(box_x + text_margin, box_y + text_margin, text, -1, text_width);

// Draw the sprite to the right inside the box
var sprite_margin = 10;
var sprite_x = box_x + box_width / 2 + sprite_margin;
var sprite_y = box_y + sprite_margin;
var sprite_scale_x = (box_width / 2 - sprite_margin * 2) / sprite_width;
var sprite_scale_y = (box_height - sprite_margin * 2) / sprite_height;
draw_sprite_ext(sprite, 0, sprite_x, sprite_y, sprite_scale_x, sprite_scale_y, 0, c_white, 1);

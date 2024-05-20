if (player_near) {
    var box_width = 150; 
    var box_height = 130; 

    var screen_x = x - camera_get_view_x(view_camera[0]);
    var screen_y = y - camera_get_view_y(view_camera[0]);

    var box_x = screen_x - box_width / 2;
    var box_y = screen_y - sprite_height - box_height - 20;

    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, true);

    draw_set_font(ft_button2);
    draw_set_color(c_white);

    var text = "Jump";
    var text_width = string_width(text);
    var text_height = string_height(text);

    var text_x = box_x + (box_width) / 2;
    var text_y = box_y + (box_height - text_height) / 2 - 20;

    draw_text(text_x, text_y, text);

    // Draw the sprite centered below the text
    var sprite_x = box_x + (box_width) / 2;
    var sprite_y = text_y + text_height + 30; // Add a margin below the text

    draw_sprite(spr_KeySpace, 0, sprite_x, sprite_y);
}

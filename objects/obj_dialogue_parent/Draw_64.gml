if (showing_dialog == true) {
    obj_player.hsp = 0; 
    var text_x = display_get_gui_width() / 2;
    var padding = 16;
    var border = 5;
    var sprite_offset_y = 8; 

    var height = string_height_ext(current_dialog.message, 16, display_get_gui_width() - 192) + padding * 2;
    if (current_dialog.sprite != -1 && sprite_get_height(current_dialog.sprite) > height) {
        height = sprite_get_height(current_dialog.sprite) + padding * 2;
    }

    if (current_dialog.sprite != -1) {
        text_x += sprite_get_width(current_dialog.sprite) / 2 + padding / 2;
    }

    var text_y = height / 2;

    draw_set_alpha(alpha);
    draw_set_font(ft_button2);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center); 
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), height + (current_dialog.choices != undefined ? 100 : 0), false); 
    draw_set_color(c_white);
    draw_rectangle(border, border, display_get_gui_width() - border, height - border + (current_dialog.choices != undefined ? 100 : 0), false);
    draw_set_color(c_black);
    draw_rectangle(border * 2, border * 2, display_get_gui_width() - (border * 2), height - (border * 2) + (current_dialog.choices != undefined ? 100 : 0), false);

    if (current_dialog.sprite != -1) {
        draw_sprite(current_dialog.sprite, 0, border * 3, border * 3 + sprite_offset_y); 
    }

    draw_set_color(c_white);
    draw_text_ext(text_x, text_y, current_dialog.message, 16, display_get_gui_width() - 192);

    alpha = lerp(alpha, 1, 0.06);
    draw_set_alpha(1);
}

if (message_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_font(ft_button2);

    var gui_x = (x - camera_get_view_x(view_camera[0])) * (display_get_gui_width() / camera_get_view_width(view_camera[0]));
    var gui_y = (y + 40 - text_height - camera_get_view_y(view_camera[0])) * (display_get_gui_height() / camera_get_view_height(view_camera[0]));

    if (text != "") {
        draw_text(gui_x, gui_y, text);
    }
}
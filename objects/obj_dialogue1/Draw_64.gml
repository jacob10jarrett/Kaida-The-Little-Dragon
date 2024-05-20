if (player_near) {
    var box_width = 500;
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

    var text = "This is a major checkpoint";
    var text_width = string_width(text);
    var text_height = string_height(text);

    var text_x = box_x + (box_width) / 2;
    var text_y = box_y + (box_height - text_height) / 2 - 20;

    draw_text(text_x, text_y, text);

    draw_set_font(ft_button3);
	
    var text2 = "You'll respawn here when you lose all your hearts";
    var text_width2 = string_width(text2);
    var text_height2 = string_height(text2);

    var text_x2 = box_x + (box_width) / 2;
    var text_y2 = box_y + (box_height - text_height2) / 2 + 20;

    draw_text(text_x2, text_y2, text2);
}

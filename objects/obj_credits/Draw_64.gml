draw_set_font(ft_button2); 
draw_set_halign(fa_center); 
draw_set_color(c_white); 

for (var i = 0; i < array_length(credits); i++) {
    var x_pos = display_get_gui_width() / 2;
    var y_pos = start_y + i * string_height("A") * 8; 
    draw_text(x_pos, y_pos, credits[i]);
}

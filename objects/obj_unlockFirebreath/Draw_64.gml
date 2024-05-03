draw_self()

if (showText) {
    var xx = display_get_gui_width() / 2; 
    var yy = display_get_gui_height() / 2; 
    draw_set_halign(fa_center); 
    draw_set_valign(fa_middle);
    draw_set_color(c_green);
    draw_set_font(ft_button);
    draw_text(xx, yy, "Fire Breath Unlocked!");
}




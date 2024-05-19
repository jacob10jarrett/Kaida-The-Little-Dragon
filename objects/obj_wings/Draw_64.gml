draw_self();

if (showText) {
    var xx = display_get_gui_width() / 2; 
    var yy = display_get_gui_height() / 2; 

    draw_set_halign(fa_center); 
    draw_set_valign(fa_middle);
    draw_set_color(c_blue);
    draw_set_font(ft_button);

    draw_text(xx, yy, "Flight Unlocked!");

    var sprite_xx = xx;
    var sprite_yy = yy + 100;

    draw_sprite_ext(spr_KeySpace, 0, sprite_xx, sprite_yy, 2, 2, 0, c_white, 1);
}
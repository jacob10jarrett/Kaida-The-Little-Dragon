draw_self(); 

if (global.near_player) {
    var text_x = x - 75;  
    var text_y = y - 100;  
	draw_set_colour(c_white);
    draw_text(text_x, text_y, "Press tab to use fire breath");
}

if (isFlashing) {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, flash_color, image_alpha);
} else {
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, original_color, image_alpha);
}

//draw_circle(0,0,300,false);
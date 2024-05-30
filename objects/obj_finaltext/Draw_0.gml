draw_set_font(ft_button2);

var text_y_start = room_height / 2 - (array_length(texts) * string_height("A")) / 2;
var text_y_offset = string_height("A") * 1.5;

for (var i = 0; i < array_length(texts) - 1; i++) {
    var current_text_width = string_width(current_texts[i]);
    var x_pos = room_width / 2;
    var y_pos = text_y_start + i * text_y_offset;

    draw_set_color(c_white);
    draw_text(x_pos, y_pos, current_texts[i]);
}

if (show_the_end) {
    var current_text_width = string_width(current_texts[array_length(texts) - 1]);
    var x_pos = room_width / 2;
    var y_pos = room_height / 2;

    draw_set_color(c_white);
    draw_text(x_pos, y_pos, current_texts[array_length(texts) - 1]);
    draw_set_font(ft_button2); 
}

if (fade_stages[array_length(texts) - 1] == 2 || fade_out_all || show_the_end || final_fade) {
    draw_set_alpha(fade_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);  
}

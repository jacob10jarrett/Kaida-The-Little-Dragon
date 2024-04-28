draw_self(); 

if (global.near_player) {
    var text_x = x - 75;  
    var text_y = y - 100;  
	draw_set_colour(c_white);
    draw_text(text_x, text_y, "Press tab to use fire breath");
}

//draw_circle(0,0,300,false);
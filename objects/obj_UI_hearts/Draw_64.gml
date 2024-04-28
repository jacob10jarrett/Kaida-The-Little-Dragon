/// @description draw hearts

for (var i=0; i<obj_player.hp; i++)
{
	draw_sprite(spr_heart, 0, (50 + 75 * i), 50);
}

//draw_circle(100,100,obj_player.alarm[1]*10,false);

draw_sprite(spr_cooldownBar, 0, 20, 100);								/* fireball */
draw_sprite(spr_cooldownBar, 0, 20, 140);								/* dash */
draw_sprite(spr_cooldownBar, 0, 20, 180);								/* firebreath */
	
draw_rectangle_colour(20, 100 ,222 - obj_player.alarm[1] ,120			/* fireball */
					,c_green, c_lime, c_lime, c_green, false);
					
draw_rectangle_colour(20, 140 ,222 - obj_player.alarm[3]*3 ,160			/* dash */
					,c_orange, c_yellow, c_yellow, c_orange, false);
					
draw_rectangle_colour(20, 180 ,222 - obj_player.alarm[2]*.80 ,200			/* firebreath */
					,c_purple, c_maroon, c_maroon, c_purple, false);
					
					


//draw_healthbar(100, 50, 250, 60,obj_player.alarm[1], c_dkgray, c_red, c_green, 0, false, false);


//     100 - (obj_player.alarm[1] * 175 / 100)
/// @description draw hearts

if (instance_exists(obj_player))
{
	
	draw_sprite(spr_hpBar, 0, 20, 60);										/* hp */
	draw_sprite(spr_cooldownBar, 0, 20, 100);								/* fireball */
	draw_sprite(spr_cooldownBar, 0, 20, 140);								/* dash */
	draw_sprite(spr_cooldownBar, 0, 20, 180);								/* firebreath */
	
	for (var i=0; i<obj_player.hp; i++)
	{
		draw_sprite(spr_heartUI, 0, (17 + 35 * i), 53);
	}
	
	draw_rectangle_colour(20, 100 ,222 - obj_player.alarm[1] ,120			/* fireball */
					,c_green, c_lime, c_lime, c_green, false);
					
	draw_rectangle_colour(20, 140 ,222 - obj_player.alarm[3]*3 ,160			/* dash */
					,c_orange, c_yellow, c_yellow, c_orange, false);
					
	draw_rectangle_colour(20, 180 ,222 - obj_player.alarm[2]*.80 ,200			/* firebreath */
					,c_purple, c_maroon, c_maroon, c_purple, false);
					
					

}

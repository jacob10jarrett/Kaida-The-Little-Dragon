/// @description draw hearts
if (global.showUI) {
	
if (instance_exists(obj_player))
	{
		//draw_sprite(spr_hpBar, 0, 20, 60);	
		var scale_factor = 1.5;
		for (var i=0; i<global.hp; i++)	/* draw hearts */
		{
			draw_sprite_ext(spr_heartUI, 0, 17 + 35 * i * scale_factor, 33, scale_factor, scale_factor, 0, c_white, 1);
		}
	
		{	/* fireballCD */
			draw_rectangle_colour(20, 100 ,222 - obj_player.alarm[1] ,120			
							,c_green, c_lime, c_lime, c_green, false);
					
			draw_sprite(spr_cooldownBar, 0, 20, 100);		
			draw_sprite(spr_KeyRightClick, 0, 260,107);
		}
	
		{	/* dashCD */
			draw_rectangle_colour(20, 140 ,222 - obj_player.alarm[3]*3 ,160			
							,c_orange, c_yellow, c_yellow, c_orange, false);
					
				draw_sprite(spr_cooldownBar, 0, 20, 140);		
				draw_sprite(spr_KeyShift, 0, 296, 148);
		}			
	
		if (obj_player.firebreathUnlocked)	/* fireBreathCD */
		{
			draw_rectangle_colour(20, 180 ,224 - obj_player.alarm[2]*.81 ,200			
								,c_purple, c_maroon, c_maroon, c_purple, false);
							
			draw_sprite(spr_cooldownBar, 0, 20, 180);	
			draw_sprite(spr_KeyTab, 0, 274,189);
		}
	}
}

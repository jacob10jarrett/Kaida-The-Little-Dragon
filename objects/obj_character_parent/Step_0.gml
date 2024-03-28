// The section below handles pixel-perfect collision checking.
// It does collision checking twice, first on the X axis, and then on the Y axis.
// On each axis, it moves the character pixel-by-pixel until its velocity for that axis is covered, or a collision is found.
// 'move_count' is how many total pixels the character needs to move this frame. It is the absolute value of the velocity on an axis.
// 'move_once' is the amount of pixels it needs to move once, before checking for a collision. It is 1, 0, or -1.


var _move_count = abs(vel_x);
var _move_once = sign(vel_x);

// This runs a loop, which runs 'move_count' times. All code in this block is repeated that many amount of times.
repeat (_move_count)
{
	// This calls the check_collision function to check for collisions on the X axis, if moved by the move_once value on that dimension.
	// The Y argument is set to 0, so for this collision there is no Y movement.
	// The result of the function, either true or false, is stored in the 'collision_found' variable, which is temporary.
	var _collision_found = check_collision(_move_once, 0);

	// This checks if collision_found is false, meaning a collision was not found, and the player is free to move once on the X axis.
	if (!_collision_found)
	{
		// In that case, move_once is added to the X coordinate of the character.
		x += _move_once;
	}
	// This 'else' block runs if a collision was found.
	else
	{
		// In that case, we reset the X velocity to 0, so the character stops its movement on that axis.
		vel_x = 0;
	
		// Then we break out of the Repeat loop, as no more collision checks are required.
		break;
	}
}

// We now repeat all of the previous steps to check for collisions on the Y axis.
// Everything is the same, but vel_x is replaced by vel_y, and the check_collision function takes a Y value (its second argument).
var _move_count = abs(vel_y);
var _move_once = sign(vel_y);

// This runs a loop, which runs 'move_count' times. All actions attached to this are repeated that many amount of times.
repeat (_move_count)
{
	// This calls the check_collision function to check for collisions on the Y axis, if moved by the move_once value.
	// The result of the function, either true or false, is stored in the 'collision_found' variable, which is temporary.
	var _collision_found = check_collision(0, _move_once);

	// This checks if collision_found is false, meaning a collision was not found, and the player is free to move once on the Y axis.
	if (!_collision_found)
	{
		// In that case, move_once is added to the Y coordinate of the character.
		y += _move_once;
	}
	// This 'else' block runs if a collision was found.
	else
	{
		// In that case, we reset the Y velocity to 0, so the character stops its movement on that axis.
		vel_y = 0;
	
		// Then we break out of the Repeat loop, as no more collision checks are required.
		break;
	}
}


//Beginning of combat system in step event
if (state == states.idle || state == states.walk){
		if (obj_player.x != 0){
			image_xscale = sign(obj_player.x);
			state_set(states.walk);
		}
		else {
			sprite_index = spr_player_idle;
		}
		
		/*if (mouse_button){
			state_set_attack(states.attack);
		}
		*/
		
}
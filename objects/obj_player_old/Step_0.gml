event_inherited();

// Set the position of the default audio listener to the player's position
audio_listener_set_position(0, x, y, 0);

// User input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_dash = keyboard_check_pressed(vk_shift);

// Reset wall direction every step to accurately detect current state
//wall_direction = 0;
// Check for wall contact to set wall_direction
if (!in_knockback && !wall_jumping && !grounded) {
    if (place_meeting(x-1, y, obj_block)) {
        wall_direction = -1; // Wall to the left
    } else if (place_meeting(x+1, y, obj_block)) {
        wall_direction = 1; // Wall to the right
    }
}

// Jumping logic, including wall jumps
if (key_jump) {
    if (!grounded && wall_direction != 0) {
        // Execute a wall jump
        vel_y = -jump_speed; // Initiate the jump upwards
        vel_x = wall_jump_force * wall_direction; // Push off the wall in the opposite direction
        wall_jumping = true; // Mark as wall jumping
        alarm[2] = 15; // Reset wall jump ability after a short delay
    } else if (grounded) {
        // Execute a normal jump
        vel_y = -jump_speed;
        instance_create_layer(x, bbox_bottom, "Instances", obj_effect_jump);
        wall_jumping = false; // Ensure wall jumping is reset when grounded
    }
}

// Gravity and movement handling
vsp += grav_speed; // Apply gravity
if (!in_knockback) {
    hsp = (key_right - key_left) * move_speed;
}


// Reset wall_jumping when grounded
if (place_meeting(x, y+1, obj_block)) {
    grounded = true;
    if (wall_jumping) {
        wall_jumping = false;
        alarm[2] = -1; // Cancel any ongoing wall jump reset delay
    }
} else {
    grounded = false;
}


if (state == 0)
{
		{																	/* base movement */
	var moving = key_right - key_left;
	hsp = moving * move_speed;
	vsp = vsp + grav_speed;
	}
	if (place_meeting(x,y+1,obj_block)) && (key_jump)							  /* jumping */
	{
		instance_create_layer(x,y+50,"Assets", obj_effect_jump);
		vsp -= jump_speed;
	}

	if (canDash == true) && (key_dash)
	{
		canDash = false;
		dashDirection = point_direction(0, 0, key_right - key_left, key_down - key_up);
		dashSpeed = dashDist/dashTime;
		dashEnergy = dashDist;
		state = 1;
	}

	if (place_meeting(x, y+1, obj_block))
	{
	    canDash = true;
	}

	
	if (key_jump) && (place_meeting(x+1, y, obj_block) || place_meeting(x-1, y, obj_block))
	{
	vsp = -jump_speed;

	}
	
	if (keyboard_check_pressed(ord("Z")))
	{
		state = 2;
	}

}

	/*-------------------------------------------ANIMATIONS----------------------------------------------------*/	
	if (vsp > 0 || vsp < 0)
	{
		idle = false;
		falling = true;
	}

	if (hsp != 0)															  /* Sprite direction */
	{
		image_xscale=(sign(hsp));
	}

	if (!place_meeting(x,y+1,obj_block))									       /* fly Anim */
	{
		sprite_index = spr_player_fly;
		if (sign(vsp) > 0 || sign(vsp) < 0)
		{
			sprite_index = spr_player_fly; 
		}
		else 
		{
			sprite_index = spr_player_idle;
		}
	}
	else 
		if (hsp == 0)														      /* idle Anim */
		{
			sprite_index = spr_player_idle
		}
		else																      /* walk Anim */
		{
			idle = false;
			sprite_index = spr_player_walk;
		}

if (state == 1)																		/* dash */
{
	sprite_index = spr_player_dash										          /* dash Anim*/
	hsp = lengthdir_x(dashSpeed, dashDirection);
	vsp = lengthdir_y(dashSpeed, dashDirection);
	
	with (instance_create_depth(x,y,depth+1, obj_dashTrail))					  /* dash trail*/
	{
		sprite_index = other.sprite_index;
		image_blend = c_ltgray;
		image_alpha = .7;
	}
	
	
	
	dashEnergy -= dashSpeed;
	if (dashEnergy <= 0)
	{
		vsp = 0;	
		hsp = 0;
		state = 0;													   /* revert state */
	}
}

if (state == 2)
{
	
	sprite_index = spr_player_sideAttack

	instance_create_layer(x,y,"player", obj_melee);
	
	alarm[3] = 5;
	state = 0;
}
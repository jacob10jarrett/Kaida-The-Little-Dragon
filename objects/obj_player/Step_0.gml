// User input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_dash = keyboard_check_pressed(vk_shift);
key_jump = keyboard_check(vk_space); 
key_jump_pressed = keyboard_check_pressed(vk_space);

// Horizontal collision with obj_block or obj_wall
if (place_meeting(x+hsp, y, obj_block) || place_meeting(x+hsp, y, obj_wall))
{
    while (!place_meeting(x+sign(hsp),y, obj_block) && !place_meeting(x+sign(hsp),y, obj_wall))
    {
        x = x + sign(hsp);
    }
    hsp = 0;
}
x = x + hsp;

// Vertical collision with obj_block or obj_wall
if (place_meeting(x, y+vsp, obj_block) || place_meeting(x, y+vsp, obj_wall))
{
    while (!place_meeting(x,y+sign(vsp), obj_block) && !place_meeting(x,y+sign(vsp), obj_wall))
    {
        y = y + sign(vsp);
    }
    vsp = 0;
    sprite_index = spr_player_idle;
    canDash = true; 
}
y = y + vsp;

wallLeft = place_meeting(x-1, y, obj_wall);
wallRight = place_meeting(x+1, y, obj_wall);

// fireball charges 
if (charges >= 3)	canFire = true; else canFire = false;

// spawn fireball
if (mouse_check_button_pressed(mb_right) && canFire)
{
	charges -= 3;
	instance_create_layer(x,y,"player", obj_fireball);
}


/*----------------------------------------- ANIMATIONS --------------------------------------------------*/	
	if (vsp > 0 || vsp < 0)
	{
		idle = false;
		falling = true;
	}

	if (hsp != 0)														/* Sprite direction */
	{
		image_xscale=(sign(hsp));
	}

	if (!place_meeting(x,y+1,obj_block))								    /* fly Anim */
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
		if (hsp == 0)													   /* idle Anim */
		{
			sprite_index = spr_player_idle
		}
		else															   /* walk Anim */
		{
			idle = false;
			sprite_index = spr_player_walk;
		}
		
/*------------------------------------------- States ----------------------------------------------------*/	

	// Melee proc	S -> 1
    if (mouse_check_button_pressed(mb_left))
    {
		state = 2;
    }
	
	// Melee proc	S -> 2
    if (mouse_check_button_pressed(mb_right))
    {
		state = 3;	
    }
	
	// Dash proc	S -> 3
    if (canDash && key_dash)					
    {
        canDash = false;
        dashDirection = point_direction(0, 0, key_right - key_left, key_down - key_up);
        dashSpeed = dashDist / dashTime;
        dashEnergy = dashDist;
        state = 1;
    }


if (state == 0)																/* normal */
{
	show_debug_message("STATE = NORMAL");

	// Wall sliding logic
	if ((wallLeft || wallRight) && !place_meeting(x, y+1, obj_block) && !place_meeting(x, y+1, obj_wall) && vsp > 0)
	{
		vsp = min(vsp, wallSlideSpeed); 
	}

	// Wall Jump Proc
	if (key_jump_pressed && (wallLeft || wallRight) && !place_meeting(x,y+1,obj_block) && !place_meeting(x,y+1,obj_wall))
	{
		vsp = -jumpHeight; 
		wallJumping = true;
		isJumping = true; 
		jumpPressedTime = 1; 
		if (wallLeft)
		{
			hsp = walkspeed; 
			lastWallJumpDir = 1;
		}
		else if (wallRight)
		{
			hsp = -walkspeed;
			lastWallJumpDir = -1;
		}
	}
	else if (place_meeting(x, y+1, obj_block) || place_meeting(x, y+1, obj_wall))
	{
		wallJumping = false; 
	}
    
    if (!wallJumping)
    {
        var moving = key_right - key_left;
        hsp = moving * walkspeed;
    }
    else
    {
        hsp = lerp(hsp, 0, 0.05);
    }
    
    vsp += grvt;
   
    // Jump Proc
	if (key_jump_pressed && place_meeting(x, y+1, obj_block))
	{
	    vsp = -jumpHeight;
	    isJumping = true;
	    jumpPressedTime = 1;
	}

	// Continue applying jump force if jump is held
	if (isJumping && key_jump && jumpPressedTime < maxJumpPressedTime)
	{
	    vsp -= jumpForce; // Apply additional jump force
	    jumpPressedTime++;
	}
	else
	{
	    isJumping = false;
	}


	
}

if (state == 1)																/* dash */
{
	show_debug_message("STATE = DASHING");
	
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

if (state == 2)																/* melee */
{
	
	show_debug_message("STATE = MELEE");
	image_speed = .75
	vsp += grvt;
	
	if (vsp != 0 && !place_meeting(x,y+sign(vsp), obj_block))
	{
		sprite_index = spr_player_sideAttackAir
	}
	else
	{
		sprite_index = spr_player_sideAttack
	}

	instance_create_layer(x,y,"Player", obj_melee);

	if  (image_index >= 3 && image_index < 4)
	{
		state = 0;
	}
	
	if (keyboard_check_pressed(ord("X"))) state = 0;
}

if (state == 3)																/* fireball */
{
	show_debug_message("STATE = FIREBALL");
	image_speed = .75
	vsp += grvt;
	
	if (vsp != 0 && !place_meeting(x,y+sign(vsp), obj_block))
	{
		sprite_index = spr_player_sideAttackAir
	}
	else
	{
		sprite_index = spr_player_sideAttack
	}
	
	if (image_index >= 3 && image_index < 4)
	{
		state = 0;
	}
}


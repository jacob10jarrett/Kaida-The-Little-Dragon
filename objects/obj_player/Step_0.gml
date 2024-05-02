// User input
if (can_control) {
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_up = keyboard_check(vk_up);
	key_down = keyboard_check(vk_down);
	key_dash = keyboard_check_pressed(vk_shift);
	key_jump = keyboard_check(vk_space); 
	key_jump_pressed = keyboard_check_pressed(vk_space);
	key_pull = keyboard_check(ord("E"));
	key_firebreath = keyboard_check_pressed(vk_tab);
}


var playerMovement = key_right - key_left;
var onGround = place_meeting(x, y+1, obj_block) || place_meeting(x, y+1, obj_crate) || place_meeting(x, y+1, obj_MovingAirPlatform) || instance_place(x, y+1, obj_MovingPlatform3);
isAirborne = !place_meeting(x, y+1, obj_block) && !(state == 4 && place_meeting(x, y+1, obj_crate) && !place_meeting(x, y+1, obj_MovingAirPlatform) && !place_meeting(x, y+12, obj_PressurePlate2));

// Bouncy Platform
var onBouncy = place_meeting(x, y+1, obj_bouncyPlatform);
if (onBouncy && vsp >= 0) {
	vsp = -jumpHeight * 3;
	audio_play_sound(snd_whoosh, 1, false)
}

var onBouncy = place_meeting(x, y+1, obj_bouncyPlatform2);
if (onBouncy && vsp >= 0) {
	vsp = -jumpHeight * 4.5;
	audio_play_sound(snd_whoosh, 1, false)
}

var onBouncy = place_meeting(x, y+1, obj_bouncyPlatform3);
if (onBouncy && vsp >= 0) {
	vsp = -jumpHeight * 6;
	audio_play_sound(snd_whoosh, 1, false)
}

// Moving air platform logic 
var platform = instance_place(x, y + 1, obj_MovingAirPlatform);
var isOnPlatform = place_meeting(x, y + 1, obj_MovingAirPlatform);

if (isOnPlatform) 
{
	
	hsp = playerMovement * walkspeed;

    if (platform.moving_right) {
        hsp += platform.hspd; 
    } else if (platform.moving_left) {
        hsp -= platform.hspd; 
    }

    if (key_right) {
        image_xscale = 0.75;  
    } else if (key_left) {
        image_xscale = -0.75; 
    } else {
        image_xscale = image_xscale;
    }
}

// Moving platform + standing on pressure plate logic 
var movingPlatform = instance_place(x, y+1, obj_MovingPlatform3);
var pressurePlate = instance_place(x, y+12, obj_PressurePlate2);
var isFallingOnPlate2 = (vsp != 0) && (pressurePlate != noone) && (pressurePlate.pp_vertical_speed < 0);
var onMovingPlatform = (movingPlatform != noone);
var onPressurePlate = (pressurePlate != noone);

if (onMovingPlatform || onPressurePlate) {
    var platform_instance = instance_place(x, y + 1, obj_MovingPlatform3) ? movingPlatform : pressurePlate;
    if (platform_instance != noone) {
        y = platform_instance.y - 38; 
    }
}

// Horizontal collision
if (place_meeting(x+hsp, y, obj_block) || place_meeting(x+hsp, y, obj_wall) || place_meeting(x+hsp, y, obj_crate) || place_meeting(x+hsp, y, obj_MovingPlatform) || place_meeting(x+hsp, y, obj_MovingAirPlatform) || place_meeting(x+hsp, y, obj_PressurePlate2))
{
    while (!place_meeting(x+sign(hsp),y, obj_block) && !place_meeting(x+sign(hsp),y, obj_wall) && !place_meeting(x+sign(hsp),y, obj_crate) && !place_meeting(x+sign(hsp),y, obj_MovingPlatform) && !place_meeting(x+sign(hsp),y, obj_MovingAirPlatform) && !place_meeting(x+sign(hsp),y, obj_PressurePlate2))
    {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Vertical collision 
if (place_meeting(x, y+vsp, obj_block) || place_meeting(x, y+vsp, obj_wall) || place_meeting(x, y+vsp, obj_crate) || place_meeting(x, y+vsp, obj_MovingAirPlatform) || place_meeting(x, y+vsp, obj_PressurePlate2)) {
    if (!place_meeting(x, y+1, obj_block) && !place_meeting(x, y+1, obj_PressurePlate2)) {
        if (isAirborne) {
            canDash = true; 
            hasDashed = false;
            isAirborne = false;
        }
    }
    while (!place_meeting(x,y+sign(vsp), obj_block) && !place_meeting(x,y+sign(vsp), obj_wall) && !place_meeting(x,y+sign(vsp), obj_crate) && !place_meeting(x,y+sign(vsp), obj_MovingAirPlatform) && !place_meeting(x,y+sign(vsp), obj_PressurePlate2)) {
        y += sign(vsp);
    }
    vsp = 0;
}

y += vsp;

wallLeft = place_meeting(x-1, y, obj_wall);
wallRight = place_meeting(x+1, y, obj_wall);

// Fireball charges 
if (charges >= 3)	canFire = true; else canFire = false;

// Spawn fireball
if (mouse_check_button_pressed(mb_right) && canFireball)
{
	canFireball = false;
	alarm[1] = 175;
	instance_create_layer(x,y,"player", obj_fireball);
}

// Crate pushing
var _isFacingCrate = false;
var _crate = instance_nearest(x, y, obj_crate);
if (instance_exists(_crate) && point_distance(x, y, _crate.x, _crate.y) <= 150) 
{
    var _directionToCrate = point_direction(x, y, _crate.x, _crate.y);
    var _isFacingCrate = (image_xscale * cos(degtorad(_directionToCrate)) > 0);
    
    if (key_pull && _isFacingCrate) {
        state = 4; 
        global.pullingCrate = _crate; 
    }
} else if (!key_pull || !_isFacingCrate) {
    if (state == 4) 
	{
        state = 0; 
    }
}

// Player death 
if (hp <= 0) {
    global.previous_room = room;
    room_goto(rm_gameOver);
}

/*----------------------------------------- ANIMATIONS --------------------------------------------------*/
var isMovingDown = (pressurePlate != noone) && (obj_PressurePlate2.pp_vertical_speed < 0);
var isFallingOnPlate2 = (vsp > 0 || vsp < 0) && isMovingDown && pressurePlate;


if (isFallingOnPlate2) {
    idle = false;
    falling = true;
    sprite_index = spr_player_fly; 
} else {
    if (!isOnPlatform && !wallJumping) {  
        if (hsp != 0) {
            image_xscale = 0.75 * sign(hsp); 
            image_yscale = 0.75;
        }
    }

    if (!place_meeting(x, y + 1, obj_block) && !place_meeting(x, y + 1, obj_PressurePlate2)) {
        // Player is in the air
        sprite_index = (sign(vsp) != 0) ? spr_player_fly : spr_player_idle;
        if (!wallJumping && state != 5) {  
            image_xscale = (key_right - key_left != 0) ? 0.75 * sign(key_right - key_left) : image_xscale;
        }
        image_yscale = 0.75;
    } else {
        if (hsp == 0) {
            // Player is idle
            sprite_index = spr_player_idle;
            if (!wallJumping) {  
                image_xscale = (key_right - key_left != 0) ? 0.75 * sign(key_right - key_left) : image_xscale;
            }
            image_yscale = 0.75;
        } else {
            // Player is walking
            idle = false;
            sprite_index = spr_player_walk;
            image_xscale = 0.75 * sign(hsp);
            image_yscale = 0.75;
        }
    }
}
		
/*------------------------------------------- States ----------------------------------------------------*/	

	// Melee proc	State -> 2
if (mouse_check_button_pressed(mb_left) && state != 5 && canMelee)
{
    instance_create_layer(x, y, "Player", obj_melee);
    if (sign(image_xscale) == 1)
    {
        instance_create_layer(x + 125, y, "Player", obj_scratch);
    }
    else
    {
        instance_create_layer(x - 125, y, "Player", obj_scratch);
    }

    var movement_pressed = keyboard_check(vk_left) || keyboard_check(ord("A")) || keyboard_check(vk_right) || keyboard_check(ord("D"));



    canMelee = false;
    alarm[0] = 10;
    state = 2;  
	}
	
	// Fireball proc	State -> 3
    if (mouse_check_button_pressed(mb_right))
    {
		state = 3;	
    }
	
	// Dash proc	State -> 1
	if (canDash && key_dash && dashReset)
	{
		dashReset = false;	alarm[3] = 60;
	    canDash = false; 
	    hasDashed = true; 
	    dashDirection = point_direction(0, 0, key_right - key_left, key_down - key_up);
	    dashSpeed = dashDist / dashTime;
	    dashEnergy = dashDist;
	    state = 1;
	}
		
	if (key_firebreath && canFirebreath && firebreathUnlocked)
	{
		canFirebreath = false;
		alarm[2] = 250;
		
		if (sign(image_xscale) > 0)
		{
			instance_create_layer(x+49,y-15,"player", obj_fireBreathEffect);	//effect
			instance_create_layer(x+115,y,"player", obj_fireBreath);			//hitbox
		}
		else 
		{
			instance_create_layer(x-49,y-15,"player", obj_fireBreathEffect);	//effect
			instance_create_layer(x-115,y,"player", obj_fireBreath);			//hitbox
		}
		
		state = 2;
	}

if (state == 0)																/* normal */
{
	show_debug_message("STATE = NORMAL");

	// Wall sliding logic
	if ((wallLeft || wallRight) && !place_meeting(x, y+1, obj_block) && !place_meeting(x, y+1, obj_wall) && vsp > 0)
	{
		vsp = min(vsp, wallSlideSpeed); 
	}

if (state == 0) // normal
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
            image_xscale = 0.75; // Fixed scale direction when wall jumping
        }
        else if (wallRight)
        {
            hsp = -walkspeed;
            lastWallJumpDir = -1;
            image_xscale = -0.75; // Fixed scale direction when wall jumping
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

        // Only allow change of image_xscale when not wall jumping
        if (moving != 0) {
            image_xscale = 0.75 * sign(moving);
        }
    }
    else
    {
        hsp = lerp(hsp, 0, 0.05);
    }
    
    vsp += grvt;
	
	// Coyote time
	if (onGround) {
	    coyoteTimer = coyoteTime; 
	    hasJumped = false; 
	} else if (!hasJumped) {
	    coyoteTimer -= (1/room_speed); 
	}

	if (onGround && vsp >= 0) {
	    hasJumped = false; 
	}
   
    // Jump Proc
    if (key_jump_pressed && ((onGround || coyoteTimer > 0) || isOnPlatform || onPressurePlate)) {
        vsp = -jumpHeight; 
        isJumping = true;
        jumpPressedTime = 1;
        isAirborne = true;
        canDash = true;
		coyoteTimer = 0;
		hasJumped = true;
        hsp = playerMovement * walkspeed; 
    }
    if (isJumping && key_jump && jumpPressedTime < maxJumpPressedTime)
    {
        vsp -= jumpForce; 
        jumpPressedTime++;
    }
    else
    {
        isJumping = false;
    }
}
}

if (state == 1) 															/* dash */
{
    show_debug_message("STATE = DASHING");
	
    sprite_index = spr_player_dash; 
    image_xscale = (image_xscale < 0 ? -0.75 : 0.75);
    image_yscale = 0.75;
    hsp = lengthdir_x(dashSpeed, dashDirection);
    vsp = lengthdir_y(dashSpeed, dashDirection);

    // Create a dash trail instance
    var trail = instance_create_depth(x, y, depth + 1, obj_dashTrail);
    with (trail)
    {
        sprite_index = other.sprite_index;
        image_xscale = other.image_xscale;
        image_yscale = other.image_yscale;
        image_blend = c_ltgray;
        image_alpha = 0.7; 
    }

    dashEnergy -= dashSpeed;
    if (dashEnergy <= 0)
    {
        vsp = 0;
        hsp = 0;
        state = 0; 
    }
}

if (state == 2)																/* melee */
{
	
	show_debug_message("STATE = MELEE");
	image_speed = .75
	vsp += grvt;
	
	if (image_index >= sprite_get_number(spr_player_sideAttack) - 1) {
        state = 0;  // Return to normal state after the animation finishes
    }
	
	if (vsp != 0 && !place_meeting(x,y+sign(vsp), obj_block))
	{
		sprite_index = spr_player_sideAttackAir
	}
	else
	{
		sprite_index = spr_player_sideAttack
	}

	//instance_create_layer(x,y,"Player", obj_melee);

	if  (image_index >= 3 && image_index < 4)
	{
		state = 0;
	}
	
	if (!key_right && !key_left) hsp = 0;
	
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
	
	if (!key_right && !key_left) hsp = 0;
	
	if (image_index >= 3 && image_index < 4)
	{
		state = 0;
	}
}

if (state == 4 && instance_exists(global.pullingCrate)) {				/* crate pushing */
	vsp += grvt;
    if (!place_meeting(global.pullingCrate.x, global.pullingCrate.y + 1, obj_block)) {
        state = 0; 
        global.pullingCrate = noone;
    } else {
        var moving = key_right - key_left;
        hsp = moving * walkspeed; 
        global.pullingCrate.hsp = hsp;
    }
}

if (key_pull && state != 4) {
    var _crate = instance_nearest(x, y, obj_crate);
    if (instance_exists(_crate) && point_distance(x, y, _crate.x, _crate.y) <= 32) {
        var _isFacingCrate = (image_xscale == 1 && _crate.x > x) || (image_xscale == -1 && _crate.x < x);
        if (_isFacingCrate) {
            state = 4;
            global.isPulling = true;
            global.pullingCrate = _crate;
        }
    }
} else if (key_pull && state == 4) {
    state = 0;
    global.isPulling = false;
    global.pullingCrate = noone;
}

if (state == 5)																/* staggered */
{
	show_debug_message("STATE = STAGGERED");
	
	//hsp = sign(image_index) * 6;
	
	
	if (isStaggered)
	{
		vsp = -3
		isStaggered = false;
	}
	
	vsp += grvt;
	
	if (place_meeting(x, y+vsp, obj_block))
	{
		while (!place_meeting(x,y+sign(vsp), obj_block))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;
	
	if (place_meeting(x+hsp, y, obj_block))
	{
		while (!place_meeting(x+sign(hsp),y, obj_block))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;
	
	if (place_meeting(x, y + 1, obj_block))
	{
		isHit = false;
		state = 0;
	}
	
}

// Can't walk out of bounds
x=clamp(x, 0, room_width);
y=clamp(y, 0, room_height);

// Flash player red when hurt
if (isFlashing) {
    flash_timer -= 1 / room_speed; 

    if (flash_timer > 0) {
        flash_color = (flash_timer * 10) mod 2 == 0 ? c_red : original_color; 
    } else {
        isFlashing = false; 
        flash_color = original_color; 
    }
}
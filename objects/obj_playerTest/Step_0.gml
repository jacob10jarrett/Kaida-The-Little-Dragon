if (grounded)
{
	grounded_x = x;
	grounded_y = y;
}

// Left Movement
if ((keyboard_check(vk_left) || keyboard_check(ord("A"))) && !instance_place(x-move_speed, y, obj_block)) {
    x -= move_speed;
    image_xscale = -1;
	wall_direction = -1;
    alarm[1] = 10;
	
	if (in_knockback or wall_jumping)
	{
	        exit;
	}
}

// Right Movement
if ((keyboard_check(vk_right) || keyboard_check(ord("D"))) && !instance_place(x+move_speed, y, obj_block)) {
    x += move_speed;
    image_xscale = 1;
	wall_direction = 1;
    alarm[1] = 10;
	if (in_knockback or wall_jumping)
	{
	        exit;
	}
}

vspeed += gravity; 

// Check if on the ground for jumping
if ((keyboard_check(vk_up) || keyboard_check(vk_space)) && instance_place(x, y + 1, obj_block)) {
    vspeed = -10; 
	grounded = false;
	if (!grounded)
	{
	        if (wall_direction != 0)
	        {
	                vel_y = -jump_speed;
	                vel_x = wall_jump_force * wall_direction * -1;
	                image_index = 0;
	                grounded = false;
	                wall_jumping = true;
	                alarm[2] = 30;
	                exit;
	        }
	}
}

y += vspeed;

var falling;

//Gravity
if (place_meeting(x, y + 1, obj_block)) {
    gravity = 0;
    falling = true;
    vspeed = 0; 
} else {
    gravity = 0.28;
    falling = false;
}

//Limit vspeed
vspeed = min(vspeed, 12);

if (instance_place(x, y, obj_ladder)) {
    if (keyboard_check(vk_up) || keyboard_check(vk_down)) {
        climbing = true;
        vspeed = 0;
        gravity = 0;
        sprite_index = spr_climbing;
    }
} else {
    climbing = false;
    sprite_index = spr_player;
}

if (climbing) {
    if (keyboard_check(vk_up)) {
        y -= climb_speed;
    }
    if (keyboard_check(vk_down)) {
        y += climb_speed;
    }

    if (place_meeting(x, y + 1, 1)) {
        climbing = false;
        sprite_index = spr_player;
    }
}

if (!climbing) {
    if (keyboard_check_pressed(ord("Z"))) {
        var sword_x = x;
        var sword_y = y;
        instance_create_layer(sword_x, sword_y, "Instances", obj_sword); // Replace "Instances" with the actual layer name if needed
    }
}

movementLock = max(movementLock - 1, 0);

if (wall_direction != 0)
{
        if (vel_y > 3) 
        {
                vel_y = 3;
        }
}


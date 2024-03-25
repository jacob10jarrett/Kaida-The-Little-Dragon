if (keyboard_check(vk_left) and !instance_place(x-move_speed, y, obj_block)) {
	x -= move_speed
	image_xscale = -1
}

if (keyboard_check(vk_right) and !instance_place(x+move_speed, y, obj_block)) {
	x += move_speed
	image_xscale = 1
}

//jump
if (keyboard_check(vk_up)) {
	show_debug_message("jumping...")
	if (instance_place(x, y+1, obj_block)) {
		vspeed = jump_height
	}
}

//gravity
if (place_meeting(x, y + 1, obj_block)) {
    gravity = 0;
} else {
    gravity = 0.28;
}

//limit vspeed
if (vspeed > 12) {  // 12 is the maximum vspeed we're allowing
    vspeed = 12;
}

vspeed = min(vspeed, 12);  // Ensures vspeed does not exceed 12

// Check for ladder collision
if (instance_place(x, y, obj_ladder)) {
    // Check if the player is holding up or down to initiate climbing
    if (keyboard_check(vk_up) || keyboard_check(vk_down)) {
        climbing = true;
        vspeed = 0;
        gravity = 0;
        sprite_index = spr_climbing;  // Change the sprite to climbing sprite
    }
} else {
    // If not colliding with the ladder, reset the climbing state and sprite
    climbing = false;
    sprite_index = spr_player;  // Change it back to the normal sprite
}

if (climbing) {
    if (keyboard_check(vk_up)) {
        y -= climb_speed;  // Move up
    }
    if (keyboard_check(vk_down)) {
        y += climb_speed;  // Move down
    }
    
    if (place_meeting(x, y + 1, 1)) {
        climbing = false;
        sprite_index = spr_player;  
    }
	
} 

if (!climbing) {
    if (keyboard_check_pressed(ord("Z"))) {
        var sword_x = x; // Set the x position for the sword
        var sword_y = y; // Set the y position for the sword
        instance_create_layer(sword_x, sword_y, "Instances", obj_sword); // Replace "Instances" with the actual layer name if needed
    }
}


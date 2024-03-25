// Left Movement
if ((keyboard_check(vk_left) || keyboard_check(ord("A"))) && !instance_place(x-move_speed, y, obj_block)) {
    x -= move_speed;
    image_xscale = -1;
}

// Right Movement
if ((keyboard_check(vk_right) || keyboard_check(ord("D"))) && !instance_place(x+move_speed, y, obj_block)) {
    x += move_speed;
    image_xscale = 1;
}

// Jumping 
if (keyboard_check(vk_up) || keyboard_check(vk_space)) {
    show_debug_message("jumping...");
    if (instance_place(x, y+1, obj_block)) {
        vspeed = jump_height;
    }
}

//Gravity
if (place_meeting(x, y + 1, obj_block)) {
    gravity = 0;
} else {
    gravity = 0.28;
}

//Limit vspeed
if (vspeed > 12) {  
    vspeed = 12;
}

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


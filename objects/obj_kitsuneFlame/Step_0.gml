// Step Event of obj_flying_object
// Calculate direction towards the player
var dir = point_direction(x, y, obj_player.x, obj_player.y);

// Calculate acceleration
var acceleration = 0.1; // Adjust as needed

// Apply acceleration towards the player
hsp += lengthdir_x(acceleration, dir);
vsp += lengthdir_y(acceleration, dir);

// Update velocity
var max_speed = 8; // Adjust as needed
hsp = clamp(hsp, -max_speed, max_speed);
vsp = clamp(vsp, -max_speed, max_speed);

// Move the obj
x += hsp;
y += vsp;




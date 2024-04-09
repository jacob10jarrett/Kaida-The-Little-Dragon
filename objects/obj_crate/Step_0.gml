vsp += grvt; // Apply gravity

// Apply friction when not being actively pushed to slow down movement
if (!global.isPulling) {
    hsp *= 0.9; // Adjust friction level as needed
}

// Handle horizontal movement and collision
if (place_meeting(x + hsp, y, obj_block) || place_meeting(x + hsp, y, obj_wall)) {
    while (!place_meeting(x + sign(hsp), y, obj_block) && !place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Handle vertical movement and collision
if (place_meeting(x, y + vsp, obj_block) || place_meeting(x, y + vsp, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp), obj_block) && !place_meeting(x, y + sign(vsp), obj_wall)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;
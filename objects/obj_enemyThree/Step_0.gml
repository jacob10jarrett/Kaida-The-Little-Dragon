if (instance_exists(obj_player))
{
    // Calculate distance to player
    var dist = distance_to_object(obj_player);

    // Determine whether to follow path or aggro on player
    if (dist < 200 && !aggro)
    {
        aggro = true;
        path_active = false; // Stop following the path
    }
    else if (dist > 400 && aggro)
    {
        aggro = false;
        path_active = true; // Resume following the path
        path_start(path_2, 2, path_action_continue, false); // Restart the path
    }

    // Handle aggro behavior (chase or attack)
    if (aggro)
    {
        image_speed = 1;
        // Flip sprite based on player position
        image_xscale = (obj_player.x > x) ? -1 : 1;
        
        // Chase or attack player
        if (dist < attackRange && canAttack)
        {
            attacking = true;
            canAttack = false;
            hsp = 0;
            alarm[0] = 100;
            alarm[1] = 20;
            alarm[2] = 70;
        }
        else if (!attacking)
        {
            hsp = (obj_player.x > x) ? 2 : -2;
        }
    }
    else if (path_active)
    {
        image_speed = 0.5; // Slower image speed while patrolling
        // Path movement is handled automatically
    }
}

// Update vertical speed
vsp += grvt;

// Horizontal collision check
if (place_meeting(x+hsp, y, obj_block))
{
    hsp = 0;
    if (canJump)
    {
        vsp = -7;
        canJump = false;
        alarm[3] = 60;
    }
}
x += hsp;

// Vertical collision check
if (place_meeting(x, y+vsp, obj_block))
{
    vsp = 0;
}
y += vsp;

// Check if hit
if (isHit && place_meeting(x, y + 1, obj_block))
{
    isHit = false;
    hsp = 0;
    vsp = 0;
}

// Destroy instance if health is depleted
if (hp <= 0) instance_destroy();





image_yscale = 3;

if (instance_exists(obj_player))
{
    var dist = distance_to_object(obj_player);

    if (dist < aggroRange && !aggro)
    {
        aggro = true;
        path_active = false; 
        image_speed = 1;
    }

    // Aggro behavior
    if (aggro)
    {
		path_active = false;
        path_end()
        image_xscale = (obj_player.x > x) ? -3 : 3;
        
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
}

vsp += grvt;

// Handle horizontal collisions
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

// Handle vertical collisions
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

if (hp <= 0) instance_destroy();

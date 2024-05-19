if (instance_exists(obj_player)) {
    //proc aggro    
    if (distance_to_object(obj_player) < aggroRange) {        
        aggro = true;
    }
    
    //break aggro
    if (distance_to_object(obj_player) > aggroRange + 200) {        
        aggro = false;
    }
    
    if (obj_player.x > x) {
        image_xscale = 1;
        facing_right = true;
    }
    if (obj_player.x < x) {
        image_xscale = -1;
        facing_right = false;
    }
}
vsp += grvt;

if (place_meeting(x + hsp, y, obj_block)) {
    hsp = 0;
    if (canJump) {
        vsp = -7;
        canJump = false;
        alarm[3] = 60;
    }
}
x += hsp;

if (place_meeting(x, y + vsp, obj_block)) {
    vsp = 0;
}
y += vsp;

if (isHit) {
    if (place_meeting(x, y + 1, obj_block)) {
        isHit = false;
        hsp = 0;
        vsp = 0;
    }
}

if (hp <= 0) {
    // Destroy fire instances that were just spawned
    for (var i = 0; i < array_length(fire_instances); i++) {
        if (instance_exists(fire_instances[i]) && !fire_instances[i].fired) {
            instance_destroy(fire_instances[i]);
        }
    }
    
    var emitter = part_emitter_create(global.particle_system);
    part_emitter_region(global.particle_system, emitter, x - 16, x + 16, y - 16, y + 16, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(global.particle_system, emitter, global.particle_type, 100);

    instance_destroy();
}
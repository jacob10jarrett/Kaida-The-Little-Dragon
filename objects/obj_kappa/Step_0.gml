vsp += grvt;

// Horizontal collision
if (place_meeting(x + hsp, y, obj_block)) {
    hsp = 0;
    if (canJump) {
        vsp = -jumpHeight;
        canJump = false;
        alarm[3] = 60;
    }
}
x += hsp;

// Vertical collision
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

if (obj_player.x > x && !awake) {
    hsp = 5;
    image_xscale = -abs(image_xscale);
}
if (obj_player.x < x) {
    hsp = -5;
    image_xscale = abs(image_xscale);
}
if (awake == true) {
    awake_time++;
    hsp = 0;
}

if (awake_time >= 100) {
    awake = false;
    sprite_index = spr_kappaAwaken;
    image_index = 0;
    image_speed = 0;
    awake_time = 0;
}

if (image_index == 5) {
    sprite_index = spr_kappaAttack;
    awake = true;
    awake_time = 0;
}

if (hp <= 0) {
    var emitter = part_emitter_create(global.particle_system);
    part_emitter_region(global.particle_system, emitter, x - 16, x + 16, y - 16, y + 16, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(global.particle_system, emitter, global.particle_type, 100);

    instance_destroy();
}

if (hp <= 0) instance_destroy();

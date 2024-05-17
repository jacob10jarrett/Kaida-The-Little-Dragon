if (!instance_place(x, y - 1, obj_player)) {
    activated = false;
    alarm[4] = 540; // cooldown period before the plate can be activated again
}
cooldown = false;

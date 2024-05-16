if (!instance_place(x, y - 1, obj_player)) {
    activated = false;
    canBeActivated = false;
    alarm[4] = 30; // cooldown period before the plate can be activated again
}
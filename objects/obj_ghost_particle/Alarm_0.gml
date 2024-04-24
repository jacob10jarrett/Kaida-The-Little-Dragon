var inst;
inst = instance_create_layer(x, y, "Instances", obj_ghost_particle);
inst.direction = point_direction(x, y, obj_player.x, obj_player.y);
inst.speed = 4;

alarm[0] = shoot_interval;

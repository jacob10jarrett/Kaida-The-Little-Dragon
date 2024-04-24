alarm[0] = room_speed * 1;
var inst;
var offsetX = 5; 
var offsetY = 10;  
inst = instance_create_layer(x + offsetX, y + offsetY, "Instances", obj_ghost_particle);
inst.direction = point_direction(x + offsetX, y + offsetY, obj_player.x, obj_player.y);

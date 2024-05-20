var player_instance = instance_nearest(x, y, obj_player);
if (player_instance != noone && point_distance(x, y, player_instance.x, player_instance.y) <= interaction_distance) {
    player_near = true;
} else {
    player_near = false;
}
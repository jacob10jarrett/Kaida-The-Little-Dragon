var player_instance = instance_nearest(x, y, obj_player);
if (distance_to_object(player_instance) <= 150) {
    message_timer = 180; 
    text = "Just a little further.";
}
var player_instance = instance_nearest(x, y, obj_player);

if (!global.dialogue_finished && distance_to_object(player_instance) <= 200) {
    global.show_key_e = true;
    if (!instance_exists(obj_dialogue_1) && !global.dialogue_active) {
        instance_create_layer(x, y, "Instances", obj_dialogue_1);
        player_instance.can_control = false;
        global.dialogue_active = true;
        global.show_key_e = true;
    }
} else {
    if (!global.dialogue_active) {
        global.show_key_e = false;
    }
}

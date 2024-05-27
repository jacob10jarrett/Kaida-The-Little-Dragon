if (showing_dialog == false) {
    if (dialog.count() <= 0) {
        global.dialogue_active = false; 
        global.show_key_e = false; 
        global.dialogue_finished = true; 
        var player_instance = instance_nearest(x, y, obj_player);
        player_instance.can_control = true;
        instance_destroy();
        return;
    }
    
    current_dialog = dialog.pop();
    showing_dialog = true;
    global.dialogue_active = true; 
    delay_timer = 10; 
} else {
    if (delay_timer > 0) {
        delay_timer--;
    } else {
        if (keyboard_check_released(key_next) || global.button_next_pressed) {
            if (current_dialog.choices != undefined) {
                showing_dialog = false;
                alpha = 0;
            } else {
                showing_dialog = false;
                alpha = 0;
            }
            
            global.button_next_pressed = false;
        }
    }
}
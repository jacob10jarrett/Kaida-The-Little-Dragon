// Inherit the parent event
event_inherited();

//global.button_next_pressed = false;

// Define the dialog_add_and_check function
function dialog_add_and_check(sprite, message) {   
    // Call the original dialog.add function
    dialog.add(sprite, message);
}

// Add dialogues
dialog_add_and_check(spr_character, "The tyrant leader threatens our very way of life.");
dialog_add_and_check(spr_character, "Our crops wither and our children go hungry.");
dialog_add_and_check(spr_character, "We don't have much longer before our food supplies disappear.");
dialog_add_and_check(spr_character, "You have been chosen, young one, to go to the sacred shrine cave.");
dialog_add_and_check(spr_character, "Learn the ways of the ancestors. Only then can you defeat the tyrant leader.");

//global.allDialoguesExhausted = true; 

// Assuming this code is in an appropriate place where x and y are defined, such as in an object's Create event
//if (global.allDialoguesExhausted) {
   // if (instance_exists(obj_button_dialogue_next)) {
     //   instance_destroy(obj_button_dialogue_next);
   // }

    //if (!instance_exists(obj_button_dialogue_start)) {
    //    instance_create_layer(x, y, "Instances_5", obj_button_dialogue_start);
    //}
//}

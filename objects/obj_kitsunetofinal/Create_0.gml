texts = [
    "A chilling roar echoed through the cavern, announcing the arrival of the tyrant leader.",
    "Kaida stood her ground, heart pounding. A moment of silence fell.",
    "A voice rumbled, filled with a mix of surprise and recognition.",
    "\"Kaida, is that you? They took you!\"",
    "Kaida's eyes widened in shock. This wasn't the tyrant leader she had imagined.",
    "It was her mother, transformed and twisted by dark magic."
];

text_index = 0;
current_texts = array_create(array_length(texts), "");
text_display_time = 180; 
text_fade_time = 60;    
step_counts = array_create(array_length(texts), 0);
fade_stages = array_create(array_length(texts), 0);
fade_steps = array_create(array_length(texts), 0);
fade_alpha = 0;
total_display_time = 120; 
delay_between_texts = 60; 

for (var i = 0; i < array_length(texts); i++) {
    fade_steps[i] = text_fade_time / string_length(texts[i]);
}
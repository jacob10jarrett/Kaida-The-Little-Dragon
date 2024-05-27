text_index = 0;
current_texts = ["", "", ""];
texts = [
    "Once upon a time",
    "there was a dragon,",
    "and her name was Kaida."
];
text_display_time = 240; 
text_fade_time = 60;    
step_counts = [0, 0, 0];
fade_stages = [0, 0, 0];
fade_steps = [0, 0, 0];
fade_alpha = 0;
total_display_time = 120; 
delay_between_texts = 60; 

for (var i = 0; i < array_length(texts); i++) {
    fade_steps[i] = text_fade_time / string_length(texts[i]);
}

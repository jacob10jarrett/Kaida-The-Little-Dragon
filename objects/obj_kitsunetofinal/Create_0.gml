text_index = 0;
current_texts = ["", "", ""];
texts_stage1 = [
    "A chilling roar echoed through the cavern, announcing the arrival of the tyrant leader.",
    "A dragon emerged from the shadows, Kaida's eyes widened in shock.",
    "This wasn't the tyrant leader Kaida had imagined."
];

texts_stage2 = [
    "It was her mother, abusing her powers for control and domination."
];

text_display_time = 240; 
text_fade_time = 120;    
step_counts = [0, 0, 0];
fade_stages = [0, 0, 0];
fade_steps = [0, 0, 0];
fade_alpha = 0;
total_display_time = 120; 
delay_between_texts = 60; 
stage = 1; 

texts = texts_stage1;

for (var i = 0; i < array_length(texts); i++) {
    fade_steps[i] = text_fade_time / string_length(texts[i]);
}

text_index = 0;
current_texts = ["", ""];
texts = [
    "It was then that the kitsune fox appeared.", 
	"A guardian of the ancient wisdom Kaida needed to defeat the tyrant."
];
text_display_time = 180; 
text_fade_time = 60;    
step_counts = [0];
fade_stages = [0];
fade_steps = [0];
fade_alpha = 0;
total_display_time = 120; 
delay_between_texts = 60; 

for (var i = 0; i < array_length(texts); i++) {
    step_counts[i] = 0;
    fade_stages[i] = 0;
    fade_steps[i] = text_fade_time / string_length(texts[i]);
}

delay_counter = 0;
delay_duration = 180; 
sound_played = false;

texts = [
    "But, in the end, Kaida emerged victorious, and the two reconciled.",
    "Her mother, once corrupted, expressed deep remorse for her actions.",
	"She gave her daughter the name Kaida, celebrating her as the little dragon with a big heart.",
	"United by a newfound understanding, Kaida and her mother vowed to use their powers for good.", 
	"Thus, their journey concluded, marking the beginning of a new era of harmony.",
];

text_index = 0;
current_texts = array_create(array_length(texts), "");
text_display_time = 180; 
text_fade_time = 60;    
step_counts = array_create(array_length(texts), 0);
fade_stages = array_create(array_length(texts), 0);
fade_steps = array_create(array_length(texts), 0);
fade_alpha = 0;
total_display_time = 180; 
delay_between_texts = 180; 
fade_out_all = false;
show_the_end = false;
final_fade = false;
the_end_display_time = 240;

for (var i = 0; i < array_length(texts); i++) {
    fade_steps[i] = text_fade_time / string_length(texts[i]);
}

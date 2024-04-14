alpha_value -= fade_speed; 

alpha_value = max(alpha_value, 0);

if (alpha_value <= 0) {
    instance_destroy(); 
}
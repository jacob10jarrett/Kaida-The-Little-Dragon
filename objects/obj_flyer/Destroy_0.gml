// Create a squashed enemy instance at the current position
instance_create_layer(x, y, "Instances", obj_monster_dead);

// Play the enemy death sound
audio_play_sound(snd_kill_monster, 1, false);

// Increase the score by 10 points
global.score += 10;




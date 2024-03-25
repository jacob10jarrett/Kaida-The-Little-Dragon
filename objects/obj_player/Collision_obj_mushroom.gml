// Play the mushroom collection sound
audio_play_sound(snd_get_mushroom, 1, false);

// Increase score by 5 points
global.score += 5;

// Destroy the mushroom instance
with(other) {
    instance_destroy();
}

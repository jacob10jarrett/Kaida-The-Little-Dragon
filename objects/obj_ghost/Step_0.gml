y = y + sin(current_time * frequency) * amplitude;

var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

if (distance_to_player <= 1650) {
    if (obj_player.hsp > 0) { 
        hsp = 0.8 * obj_player.hsp;
    } else {
        hsp = 0; 
    }
} else {
    hsp = 0; 
}

x += hsp;


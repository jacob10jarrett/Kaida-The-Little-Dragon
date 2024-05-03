
var float_speed = 0.005; 


var target_x = obj_player.x;
var target_y = obj_player.y;


x = lerp(x, target_x, float_speed);
y = lerp(y, target_y, float_speed);
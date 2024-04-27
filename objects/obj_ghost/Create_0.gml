//Based on japanese hitodama

amplitude = .7; 
frequency = 0.002; 
start_y = y; 
near_player = false;

global.trigger_caves_cutscene = false;
global.trigger_caves_cutscene2 = false;
cutscene1_triggered = false;
cutscene2_triggered = false;

shoot_interval = 300; 
alarm[0] = shoot_interval; 

target_x = x;  
target_y = y + 50;

psys = -1; 
ptype = -1; 
pemit = -1;
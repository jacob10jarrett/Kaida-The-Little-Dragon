enum states
{
	free, dash, melee
}

state = 0;

move_speed = 5;

friction_power = 0.7;

jump_speed = 15;

grav_speed = .28;

falling = false;
idle = true;
canDash = true;
dashDist = 250;
dashTime = 15;

hsp = 0;
vsp = 0;

grounded = false;
grounded_x = x;
grounded_y = y;

max_hp = 3;
hp = max_hp;

no_hurt_frames = 0;

defeated_object = obj_player_defeated;


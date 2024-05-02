hsp = 0;
vsp = 0;
grvt = 0.7;
walkspeed = 8;
isJumping = false; 
jumpPressedTime = 1; 
maxJumpPressedTime = 12; 
jumpForce = 1; 
game_over_initiated = false;

image_xscale = 0.75; 
image_yscale = 0.75; 

falling = false;
idle = true;
canDash = true;
canMelee = true
canFireball = true;
canFirebreath = true;  //CHANGE!!!
firebreathUnlocked = false;

hasDashed = false;
dashDist = 250;
dashTime = 15;
dashReset = true;

isAirborne = false;
isStaggered = false;
isHit = false;

coyoteTime = 0.2;
coyoteTimer = 0; 
hasJumped = false; 

onPressurePlate = false;
can_control = true;
rotating_cutscene_caves = false;
cave_cutscene_sound_played = false;

wallJumping = false;
lastWallJumpDir = 0; 
wallSlideSpeed = 2;

charges = 3;
canFire = true;

global.isPulling = false;
global.pullingCrate = noone;
global.pushingForce = 0.5;

global.near_player = false;

state = 0;

flash_duration = 60; 
flash_timer = 0;
isFlashing = false; 
original_color = c_white; 
flash_color = c_red; 
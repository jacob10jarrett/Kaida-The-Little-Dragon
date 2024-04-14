hsp = 0;
vsp = 0;
grvt = 0.7;
walkspeed = 8;
hp = 100;
isJumping = false; 
jumpPressedTime = 1; 
maxJumpPressedTime = 12; 
jumpForce = 1; 
jumpHeight = 7;

falling = false;
idle = true;
canDash = true;
hasDashed = false;
dashDist = 250;
dashTime = 15;
isAirborne = false;

wallJumping = false;
lastWallJumpDir = 0; 
wallSlideSpeed = 2;

charges = 3;
canFire = true;

global.isPulling = false;
global.pullingCrate = noone;
global.pushingForce = 0.5;

state = 0;
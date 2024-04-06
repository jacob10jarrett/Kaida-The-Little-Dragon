image_alpha = 0.7; 
fadeRate = 0.07; 
sizeDecay = .95; 
initialScale = 1.2;

if (obj_player.image_xscale < 0)
{
	image_xscale *= -.75
}
else if (obj_player.image_xscale > 0)
{
	image_xscale *= .75
}



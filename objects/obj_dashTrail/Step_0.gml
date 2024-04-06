image_alpha -= fadeRate;
image_xscale *= sizeDecay; 
image_yscale *= sizeDecay; 
if (image_alpha <= 0) instance_destroy();
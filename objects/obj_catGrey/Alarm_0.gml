if(facing_right)
{
instance_create_layer(x+50,y-10,"VisibleObjects",obj_catFire)
}

else
{
instance_create_layer(x-50,y-10,"VisibleObjects",obj_catFire)
}
alarm[0] = 100


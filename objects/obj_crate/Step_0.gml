vsp += grvt;

//instance_create_layer(x,y-30,"Player", obj_E);


if (!global.isPulling) {
    hsp *= 0.9; 
}

if (place_meeting(x + hsp, y, obj_block) || place_meeting(x + hsp, y, obj_wall)) {
    while (!place_meeting(x + sign(hsp), y, obj_block) && !place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, obj_block) || place_meeting(x, y + vsp, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp), obj_block) && !place_meeting(x, y + sign(vsp), obj_wall)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if (!place_meeting(x, y + 1, obj_block)) {
	global.isPulling = false;
    vsp += grvt; 
    image_angle += 5; 
} else {
    if (image_angle % 360 != 0) {
        var target_angle = round(image_angle / 90) * 90;
        image_angle = lerp(image_angle, target_angle, 0.45); 
    }
    vsp = 0;
}

y += vsp;
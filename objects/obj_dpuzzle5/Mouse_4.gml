if (place_meeting(x - 128, y, obj_blank)) {
    x -= 128;
    obj_blank.x += 128;
} else if (place_meeting(x + 128, y, obj_blank)) {
    x += 128;
    obj_blank.x -= 128;
} else if (place_meeting(x, y - 128, obj_blank)) {
    y -= 128;
    obj_blank.y += 128;
} else if (place_meeting(x, y + 128, obj_blank)) {
    y += 128;
    obj_blank.y -= 128;
}

audio_play_sound(snd_whoosh, 9, false);
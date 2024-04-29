var all_correct = true;

with (obj_dpuzzle1) {
    if (x != room_width - 384 || y != 0) { // 3rd column from the left, top row
        all_correct = false;
    }
}
with (obj_dpuzzle2) {
    if (x != room_width - 256 || y != 0) { // 2nd column from the left, top row
        all_correct = false;
    }
}
with (obj_dpuzzle3) {
    if (x != room_width - 128 || y != 0) { // 1st column from the left, top row
        all_correct = false;
    }
}
with (obj_dpuzzle4) {
    if (x != room_width - 384 || y != 128) { // 3rd column from the left, bottom row
        all_correct = false;
    }
}
with (obj_dpuzzle5) {
    if (x != room_width - 256 || y != 128) { // 2nd column from the left, bottom row
        all_correct = false;
    }
}
with (obj_blank) {
    if (x != room_width - 128 || y != 128) { // 1st column from the left, bottom row
        all_correct = false;
    }
}

if (all_correct) {
    show_message("Mountain Mini-Puzzle Completed!");
}

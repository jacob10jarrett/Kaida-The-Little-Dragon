if (pemit != -1) {
    part_emitter_destroy(psys, pemit);
    pemit = -1; 
}

if (ptype != -1) {
    part_type_destroy(ptype);
    ptype = -1; 
}

if (psys != -1) {
    part_system_destroy(psys);
    psys = -1; 
}


randomize();

hp = 30;

attack_time = 50;
attack_time_counter = 0;

flash_timer = 0;
flash_length = 5;
flash_for_taking_damage = false;

sword_cooldown = 20;
sword_timer = sword_cooldown;

room_inst = instance_nearest(x, y, oRoom);
active = false;
starting_x = x;
starting_y = y;



h = 150;
w = 150;

pos1 = [starting_x - w, starting_y - h];
pos2 = [starting_x, starting_y - h];
pos3 = [starting_x + w, starting_y - h];
pos4 = [starting_x - w, starting_y];
pos5 = [starting_x, starting_y];
pos6 = [starting_x + w, starting_y];
pos7 = [starting_x - w, starting_y + h];
pos8 = [starting_x, starting_y + h];
pos9 = [starting_x + w, starting_y + h];

pos_array = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9];

current_pos = pos1;

//if (mouse_check_button_pressed(mb_left))
//	give_player_item("long_sword");

if (hp <= 0 and keyboard_check_pressed(ord("R")))
	game_restart();
	
if (keyboard_check_pressed(ord("T")))
	instance_create_layer(x + 20, y, "NPC", oMerchant);
	



boss_damage_cooldown_counter++;	


if (mouse_check_button_pressed(mb_right))
	game_restart();
if (keyboard_check_pressed(vk_escape))
    text_mode = false;
if (text_mode == true)
	exit;
movement_and_collision();
check_swing_sword();

if (keyboard_check_pressed(ord("W"))) last_wasd_key = "W";
else if (keyboard_check_pressed(ord("A"))) last_wasd_key = "A";
else if (keyboard_check_pressed(ord("S"))) last_wasd_key = "S";
else if (keyboard_check_pressed(ord("D"))) last_wasd_key = "D";
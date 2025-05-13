if (mouse_check_button_pressed(mb_right))
	game_restart();
if (keyboard_check_pressed(vk_escape))
    text_mode = false;
if (text_mode == true)
	exit;
movement_and_collision();




// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_for_end_input_text()
{
	if (keyboard_check_pressed(vk_enter) and input_text != "")
	{
		got_player_msg();
		array_push(input_history, input_text);
		input_text = "";
	}
}
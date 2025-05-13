// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_for_end_input_text()
{
	if (keyboard_check_pressed(vk_enter))
	{
		array_push(input_history, input_text);
		if (input_text == "YES")
		{
			output_text = "Good job. Here's a key. Bye! Press 'esc' to exit.";
			give_player_key();
		}
		else
			output_text = "That's not the answer. Just type YES.";
		input_text = "";
	}
}
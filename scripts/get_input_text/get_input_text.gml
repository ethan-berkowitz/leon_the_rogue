// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_input_text()
{
	if (string_length(input_text) < max_length)
	{
	    for (var key = 32; key <= 255; key++)
		{
			if (keyboard_check_pressed(key))
			{
				input_text += chr(key);
		        break;
			}
		}
	}			  
	if (keyboard_check_pressed(vk_backspace))
	{
	    if (string_length(input_text) > 0)
	        input_text = string_delete(input_text, string_length(input_text), 1);
	}
}

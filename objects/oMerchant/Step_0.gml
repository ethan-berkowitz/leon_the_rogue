if (oPlayer.text_mode == true and key_given == false)
{
	if (called_init == false)
	{
		init_llm();
		called_init = true;
	}
	get_input_text();
	check_for_end_input_text();
}
else
{
	input_text = "";
	called_init = false;
}












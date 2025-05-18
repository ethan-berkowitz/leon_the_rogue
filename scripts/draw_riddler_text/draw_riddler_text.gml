// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_riddler_text()
{
	var xx = camera_get_view_x(oCamera.camera) + 80;
	var yy = camera_get_view_y(oCamera.camera) + 80;

	draw_sprite(sNPCTextBox, 0, xx, yy);

	draw_set_font(fSmall);
	draw_text_ext(xx + 10, yy + 10, "(Press 'Esc' to exit)", 20, 460);
	if (input_text == "")
		draw_text_ext(xx + 14, yy + 291, "(Type anything...)", 20, 460);
	draw_set_font(fDefault);
	draw_text_ext(xx + 10, yy + 36, self.llm_reply, 20, 460);
	draw_text_ext(xx + 15, yy + 288, input_text, 20, 460);
}
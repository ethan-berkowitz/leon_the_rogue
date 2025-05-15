// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_swing_sword()
{
	if (keyboard_check(ord("M")) and !instance_exists(oSword))
		instance_create_layer(x, y, "Sword", oSword);
}
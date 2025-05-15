swing_spd = 8;

angle = 45;
end_angle = angle - 90;

if (keyboard_check(ord("D")))
{
	angle = 45;
	end_angle = angle - 90;
}
else if (keyboard_check(ord("A")))
{
	angle = 135;
	end_angle = angle + 90;
}
else if (keyboard_check(ord("W")))
{
	angle = 135;
	end_angle = angle - 90;
}
else if (keyboard_check(ord("S")))
{
	angle = 225;
	end_angle = angle + 90;
}

else if (oPlayer.last_wasd_key == "W")
{
	angle = 135;
	end_angle = angle - 90;
}
else if (oPlayer.last_wasd_key == "A")
{
	angle = 135;
	end_angle = angle + 90;
}
else if (oPlayer.last_wasd_key == "S")
{
	angle = 225;
	end_angle = angle + 90;
}

image_angle = angle;













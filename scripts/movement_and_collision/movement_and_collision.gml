
function movement_and_collision()
{
	
	if (keyboard_check_pressed(ord("A"))) key_time.left = current_time;
	if (keyboard_check_pressed(ord("D"))) key_time.right = current_time;
	if (keyboard_check_pressed(ord("W"))) key_time.up = current_time;
	if (keyboard_check_pressed(ord("S"))) key_time.down = current_time;

	if (keyboard_check_released(ord("A"))) key_time.left = -1;
	if (keyboard_check_released(ord("D"))) key_time.right = -1;
	if (keyboard_check_released(ord("W"))) key_time.up = -1;
	if (keyboard_check_released(ord("S"))) key_time.down = -1;
	
	var move_x = 0;
	var move_y = 0;

	// Horizontal movement
	if (keyboard_check(ord("A")) && !keyboard_check(ord("D")))
	    move_x = -1;
	else if (!keyboard_check(ord("A")) && keyboard_check(ord("D")))
	    move_x = 1;
	else if (keyboard_check(ord("A")) && keyboard_check(ord("D")))
	    move_x = (key_time.left < key_time.right) ? -1 : 1;

	// Vertical movement
	if (keyboard_check(ord("W")) && !keyboard_check(ord("S")))
	    move_y = -1;
	else if (!keyboard_check(ord("W")) && keyboard_check(ord("S")))
	    move_y = 1;
	else if (keyboard_check(ord("W")) && keyboard_check(ord("S")))
	    move_y = (key_time.up < key_time.down) ? -1 : 1;

	// Normalize
	if (move_x != 0 || move_y != 0)
	{
	    var len = point_distance(0, 0, move_x, move_y);
	    move_x /= len;
	    move_y /= len;
	}

	// Collision movement
	var new_x = x + move_x * spd;
	var new_y = y + move_y * spd;

	if (!place_meeting(new_x, y, oCollision) && !place_meeting(new_x, y, oDoor) && !place_meeting(new_x, y, oBossDoor))
	    x = new_x;

	if (!place_meeting(x, new_y, oCollision) && !place_meeting(x, new_y, oDoor) && !place_meeting(x, new_y, oBossDoor))
	    y = new_y;
}
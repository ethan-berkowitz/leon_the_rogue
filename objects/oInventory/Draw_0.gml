var camera_x = camera_get_view_x(oCamera.camera);
var camera_y = camera_get_view_y(oCamera.camera);


var inventory_str = "Inventory: ";
var size = ds_list_size(oPlayer.inventory)
for (var i = 0; i < size; i++)
{
    inventory_str += ds_list_find_value(oPlayer.inventory, i);
	if (i + 1 < size)
		inventory_str += ", ";
}

draw_text(camera_x + 3, camera_y, inventory_str);
draw_text(camera_x + 3, camera_y + 20, "Gold: " + string(oPlayer.gold));
draw_text(camera_x + 3, camera_y + 40, "HP: " + string(oPlayer.hp));
if (oPlayer.hp <= 0)
{
	draw_set_color(c_black);	
	draw_rectangle(camera_x, camera_y, camera_x + 2000, camera_y + 2000, false);
	draw_set_color(c_white);
	//draw_set_font(fDefault);
	//draw_text(camera_x + 280, camera_y + 400, "Press 'R' to Restart");
	draw_set_font(fGameOver);
	draw_text(camera_x + 75, camera_y + 200, "YOU DIED");
}





var camera_x = camera_get_view_x(oCamera.camera);
var camera_y = camera_get_view_y(oCamera.camera);


var inventory_str = "Inventory: ";
for (var i = 0; i < ds_list_size(oPlayer.inventory); i++)
    inventory_str += ds_list_find_value(oPlayer.inventory, i) + ", ";

draw_text(camera_x + 3, camera_y, inventory_str);
draw_text(camera_x + 3, camera_y + 20, "Gold: " + string(oPlayer.gold));
draw_text(camera_x + 3, camera_y + 40, "HP: " + string(oPlayer.hp));
//draw_text(camera_x + 3, camera_y + 20, "input_history: " + string(oRiddler.input_history));







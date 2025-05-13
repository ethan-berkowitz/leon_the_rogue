
function remove_item_from_inventory(item)
{
	index = ds_list_find_index(oPlayer.inventory, item);
	if (index != -1)
		ds_list_delete(oPlayer.inventory, index);
}

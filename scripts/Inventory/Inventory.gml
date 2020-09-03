// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function addInventoryItem(item, count){
	
	var invList = oController.invList;
	// If item already exists in list
	var listSize = ds_list_size(invList);
	
	for(var i = 0; i < listSize; i++) {
		// Get array
		var arr = invList[| i];
		
		// Check item
		if(arr[0] == item) {
			arr[@ 1] += count;
			return true;
		}
	}
	
	// Inventory Full
	if(listSize >= INVENTORY_SIZE) {
		return false;
	}

	// Otherwise create new array
	var arr = [item, count];
	ds_list_add(invList, arr);
	return true;
}
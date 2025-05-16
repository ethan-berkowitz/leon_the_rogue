
show_debug_message("THIS IS ASYNC HANDLER");

if ds_map_find_value(async_load, "id") == request_id {

	switch (ds_map_find_value(async_load, "status")) {
	        case 1:
				show_debug_message("ASYNC IN PROGRESS");
			   break;
			   
	        case 0:
				show_debug_message("ASYNC IS RECEIVED");
				
				if (ds_map_exists(async_load, "result")) {
					show_debug_message("HAS RESULT");
				}
				
				// json_decode() creates nested DSMaps
				var _result = ds_map_find_value(async_load, "result");
				var _map = json_decode(_result);
				
								
								
				var _out1 = ds_map_find_value(_map, "output");
				
				var _out2 = ds_map_find_value(_out1, "content");
				
				var _out3 = ds_map_find_value(_out2, "text");
				
				show_debug_message("OUTPUT: " + _out3);
				llm_reply = _out3;
				
				request_id = -1;
				
				//llm_reply = json_encode(_map);
				
				break;
			
	        default:
				show_debug_message("ASYNC FAIL");
				request_id = -1;
	    }
}
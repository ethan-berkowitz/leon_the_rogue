
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
				
				show_debug_message("RECEIVED: " + _result);
				
				var _map = json_decode(_result);
			
				var _out1 = ds_map_find_value(_map, "output");
				
				var _out2 = ds_map_find_value(_out1, "content");
								
				var _out3 = ds_map_find_value(_out2, "text");
				
				show_debug_message("OUTPUT: " + _out3);
				llm_reply = _out3;
				
				//array_push(whole_prompt.input, {
				//	role: "assistant",
				//	content: [{
				//		type: "output_text",
				//		text: llm_reply
				//	}]
				//});
				array_push(whole_prompt [$ "input"], new MakeInput("assistant", new MakeContent("output_text", llm_reply)));
				
				show_debug_message("NEW WHOLE PROMPT: " + json_stringify(whole_prompt));
				request_id = -1;
				
				ds_map_destroy(_map);
				ds_map_destroy(_out1);
				ds_map_destroy(_out2);
				
				break;
			
	        default:
				show_debug_message("ASYNC FAIL");
				request_id = -1;
	    }
}
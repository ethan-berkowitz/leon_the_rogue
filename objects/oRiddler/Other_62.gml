
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
				
				if (ds_map_exists(_out1 [| 0], "type")) {
					show_debug_message("OUTPUT TYPE IS: " + ds_map_find_value(_out1[| 0], "type"));
					if (ds_map_find_value(_out1[| 0], "type") == "function_call") {
						var _func_call = _out1[| 0];
						show_debug_message("CALLING FUNCTION: " + ds_map_find_value(_func_call, "name"))
						if (ds_map_find_value(_func_call, "name") == "sell_item") {
							show_debug_message("ARGS: " + ds_map_find_value(_func_call, "arguments"));
							
							var _func_input_struct = new MakeToolCallInput(_func_call);
							variable_struct_set(_func_input_struct, "id", _func_call[? "id"]);
							array_push(self.whole_prompt [$ "input"], _func_input_struct);
							var _sell_result = sell_item(ds_map_find_value(_func_call, "arguments"));
							var _func_output_struct = new MakeToolCallOutput(_func_call);
							show_debug_message("SELL RESULT: " + _sell_result);
							_func_output_struct.output = _sell_result;
							array_push(self.whole_prompt [$ "input"], _func_output_struct);
							for (i = 0; i < array_length(self.whole_prompt.input); i++) {
								show_debug_message("INPUT NUMBER: " + string(i) + json_stringify(self.whole_prompt.input[i]));
							}
							if (json_decode(_sell_result)[? "success"] == "false") {
								show_debug_message("ASYNC NO MONEY");
								array_push(self.whole_prompt.input, new MakeInput("user", new MakeContent("input_text", "I dont have enough gold")));
								self.llm_reply = "You do not have enough gold for that";
							} else {
								self.llm_reply = "Thank you for the purchase!";
							}
							ds_map_destroy(_map);
							//ds_map_destroy(_out1);
							ds_map_destroy(_func_call);
							
							//make_request();							
						}
						else if (ds_map_find_value(_func_call, "name") == "give_key") {
							show_debug_message("GIVING KEY");
							
							var _func_input_struct = new MakeToolCallInput(_func_call);
							variable_struct_set(_func_input_struct, "id", _func_call[? "id"]);
							array_push(self.whole_prompt [$ "input"], _func_input_struct);
							give_key();
							self.llm_reply = "Congratulations! Here's a key!";
							//var _sell_result = sell_item(ds_map_find_value(_func_call, "arguments"));
							//var _func_output_struct = new MakeToolCallOutput(_func_call);
							//show_debug_message("SELL RESULT: " + _sell_result);
							//_func_output_struct.output = _sell_result;
							//array_push(self.whole_prompt [$ "input"], _func_output_struct);
							//for (i = 0; i < array_length(self.whole_prompt.input); i++) {
							//	show_debug_message("INPUT NUMBER: " + string(i) + json_stringify(self.whole_prompt.input[i]));
							//}
							//if (json_decode(_sell_result)[? "success"] == "false") {
							//	show_debug_message("ASYNC NO MONEY");
							//	array_push(self.whole_prompt.input, new MakeInput("user", new MakeContent("input_text", "I dont have enough gold")));
							//	self.llm_reply = "You do not have enough gold for that";
							//} else {
							//	self.llm_reply = "Thank you for the purchase!";
							//}
							ds_map_destroy(_map);
							//ds_map_destroy(_out1);
							ds_map_destroy(_func_call);
							
							//make_request();							
						}
					} else { // not a func call
						var _out2 = ds_map_find_value(_out1[| 0], "content");
								
						var _out3 = ds_map_find_value(_out2[| 0], "text");
				
						show_debug_message("OUTPUT: " + _out3);
						self.llm_reply = _out3;
						self.llm_reply = string_replace(self.llm_reply, chr(8212), "--");
						
						
						array_push(self.whole_prompt [$ "input"], new MakeInput("assistant", new MakeContent("output_text", self.llm_reply)));
				
						show_debug_message("NEW WHOLE PROMPT: " + json_stringify(self.whole_prompt));
						ds_map_destroy(_out2);
					}
					//if (array_length(self.whole_prompt.input) >= 7) {
					//	show_debug_message("HAS INPUT [6]: " + json_encode(self.whole_prompt.input[6]));	
					//}
				}
				
				request_id = -1;
				
				ds_map_destroy(_map);
				//ds_map_destroy(_out1);

				
				break;
			
	        default:
				show_debug_message("ASYNC FAIL");
				request_id = -1;
	    }
}
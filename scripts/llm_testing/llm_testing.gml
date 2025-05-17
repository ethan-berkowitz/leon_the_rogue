
function MakeContent(_type, _text) constructor
{
    type = _type;
    text = _text;
}

function MakeInput(_role, _content) constructor
{
    role = _role;
    content = [];
	array_push(content, _content);
}

function MakeToolCallInput(_map) constructor {
	type = _map[? "type"];
	//id = _map[? "id"];
	call_id = _map[? "call_id"];
	name = _map[? "name"];
	arguments = _map[? "arguments"];	
}

function MakeToolCallOutput(_map) constructor {
	show_debug_message("ASDFASDFASDGHASDLJGSA" + _map[? "type"]);
	//type = _map[? "type"];
	type = "function_call_output";
	call_id = _map[? "call_id"];
	output = "";	
}

function MakeTool() constructor
{
	arr = [ "item_id", "quantity","price"];
	
	type = "function";
	name = "sell_item";
	description = "Sell an item from your inventory in exchange for gold coins";
	strict = true;
	parameters = {
		type: "object",
		required: arr,
    properties: {
      price: {
        type: "number",
        description: "Sale price per item in gold coins"
      },
      item_id: {
        type: "string",
        description: "Unique identifier for the item being sold"
      },
      quantity: {
        type: "number",
        description: "Number of items to sell"
      }
    },
    additionalProperties: false
  }
  //array.push(parameters [$ "required"], "item_id", "quantity","price");
}

function sell_item(_args) {
	show_debug_message("ENTERED SELL_ITEM");
	show_debug_message(typeof(_args));
	//show_debug_message(_args)
	_arg_map = json_decode(_args);
	show_debug_message("price: " + string(_arg_map[? "price"]));
	show_debug_message("ID: " + string(_arg_map[? "item_id"]));
	show_debug_message("quantity: " + string(_arg_map[? "quantity"]));	
	
	if (oPlayer.gold >= _arg_map[? "price"]) {
		give_player_item(string(_arg_map[? "item_id"]));
		oPlayer.gold -= _arg_map[? "price"];
		return json_stringify({success: "true"});
	} else {
		show_debug_message("SELL_ITEM: FAIL TO SELL");
		return json_stringify({success: "false"});
	}
}

function make_request(){
	show_debug_message("entered make_request()");

	req_body = json_stringify(whole_prompt);
	show_debug_message("SENDING: " + req_body);

	var url = "https://api.openai.com/v1/responses";
	var headers = ds_map_create();
	ds_map_add(headers, "Content-Type", "application/json");
	ds_map_add(headers, "Authorization", "Bearer " + apikey);
	show_debug_message("GARBAGE: " + json_encode(headers));
	self.request_id = http_request(url, "POST", headers, req_body);
	show_debug_message("Request ID: " + string(request_id));
	ds_map_destroy(headers);
	raw_result = "Loading...";
	data = undefined;
	summary_text = "Loading...";

	show_debug_message("REQUEST ID: " + string(request_id))
}

function got_player_msg(){
	show_debug_message("GOT MESSAGE FROM PLAYER");
	show_debug_message(input_text);
	
	array_push(whole_prompt [$ "input"], new MakeInput("user", new MakeContent("input_text", input_text)));
	
	make_request();	
}

function init_llm() {
	// read prompt from file

	file_id = file_text_open_read("trader_1_sys_prompt.txt");
	sys_prompt_trader_1 = "";
	while (!file_text_eof(file_id)) {
	        sys_prompt_trader_1 += file_text_readln(file_id);
	}
	file_find_close();
		
	// read api key from file
	file_id_apikey = file_text_open_read("openai_api_key.txt");
	apikey = file_text_readln(file_id_apikey);
	file_find_close();
	
	// the initial request
	sys_content = [
		{
			type: "input_text",
			text: sys_prompt_trader_1
		},
	]
	
	input = [
		{
			role: "system",
			content: sys_content
		},
	]
		
	array_push(whole_prompt [$ "input"], new MakeInput("system", new MakeContent("input_text", sys_prompt_trader_1)));
	array_push(whole_prompt [$ "tools"], new MakeTool());
	
	make_request();
}
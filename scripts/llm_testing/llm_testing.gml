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

function make_request(){
	show_debug_message("entered llm_testing()");

//array_push(whole_prompt.input, new MakeContent("output_text", "Would you like a sword"));

	req_body = json_stringify(whole_prompt);
	show_debug_message("SENDING: " + req_body);

	var url = "https://api.openai.com/v1/responses";
	var headers = ds_map_create();
	ds_map_add(headers, "Content-Type", "application/json");
	ds_map_add(headers, "Authorization", "Bearer " + apikey);
	show_debug_message("GARBAGE: " + json_encode(headers));
	request_id = http_request(url, "POST", headers, req_body);
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
	sys_content = [
		{
			type: "input_text",
			text: sys_prompt_trader_1
		},
	]
	content = [
		{
			type: "input_text",
			text: input_text
		},
	]
	input = [
		{
			role: "system",
			content: sys_content
		},
		{
			role: "user",
			content: content
		},		
	]
	
	//whole_prompt.model = "gpt-4.1-nano";
	array_push(whole_prompt [$ "input"], new MakeInput("user", new MakeContent("input_text", input_text)));
	//whole_prompt.input = input;
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
		
	//whole_prompt.model = "gpt-4.1-nano";
	array_push(whole_prompt [$ "input"], new MakeInput("system", new MakeContent("input_text", sys_prompt_trader_1)));
	//whole_prompt.input = input;
	make_request();
}
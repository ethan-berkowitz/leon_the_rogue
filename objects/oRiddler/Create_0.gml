input_text = "";
output_text = "Can you solve this riddle? Say YES.";
input_history = [];
max_length = 50;
key_given = false;
// variables created here will be in the scope of Riddler...
llm_reply = "";
sys_prompt_trader_1 = "";
apikey = "";
show_debug_message("CREATE RIDDLER");

//s_content = { type: "", text: ""};

//content = [];

//input = [];

whole_prompt = {
	model : "gpt-4.1-nano",
	//input: input
	input: []
	//new MakeInput("system", new MakeContent("input_text", ""))
	//input: [
	//	{
	//		role: "",
	//		content: [{
	//			type: "",
	//			text: ""
	//			}]
	//	}]
};

//array_push(whole_prompt [$ "input"], {role:"asd", content: "asd"});

request_id = -1;
init_llm();
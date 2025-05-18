input_text = "";
output_text = "I am riddler. What do you want?";
input_history = [];
max_length = 50;
key_given = false;
llm_reply = "";
sys_prompt_trader_1 = "";
apikey = "";
show_debug_message("CREATE RIDDLER");

whole_prompt = {
    model : "gpt-4.1",
    input: [],
    tools: []
};

request_id = -1;
init_llm("riddler");
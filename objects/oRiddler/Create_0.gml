input_text = "";
output_text = "Can you solve this riddle? Say YES.";
input_history = [];
max_length = 50;
key_given = false;
// variables created here will be in the scope of Riddler...
llm_reply = "";
sys_prompt_trader_1 = "";
apikey = "";
whole_prompt = {};
request_id = -1;
init_llm();
function fish_user_key_bindings
  # Git key bindings
  bind --key f1 "eval_and_redisplay_prompt git status"
  bind --key f2 "eval_and_redisplay_prompt git diff"
  bind --key f3 "eval_and_redisplay_prompt git diff --staged"
  bind --key f4 "eval_and_redisplay_prompt tig status"
  bind --key f5 "eval_and_redisplay_prompt git pull --ff-only"
  bind --key f6 "eval_and_redisplay_prompt git log"
  bind --key f7 "eval_and_redisplay_prompt git show"
end

# Evaluates the given arguments, then redisplays the prompt
function eval_and_redisplay_prompt
  printf "%s%s%s\n" (set_color cyan) "$argv" (set_color normal)
  eval $argv
  fish_prompt
end

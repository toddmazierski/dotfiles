# Copied from https://github.com/bswinnerton/dotfiles/blob/master/fish/prompt.auto.fish
set -g __fish_git_prompt_show_informative_status 'yes'

set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showstashstate 'no'
set -g __fish_git_prompt_showuntrackedfiles 'no'
set -g __fish_git_prompt_showupstream 'yes'
set -g __fish_git_prompt_color_dirtystate red
set -g __fish_git_prompt_color_stagedstate red
set -g __fish_git_prompt_color_untrackedfiles red
set -g __fish_git_prompt_color_upstream red
set -g __fish_git_prompt_color_cleanstate green
set -g __fish_git_prompt_color_invalidstate red

set -g __fish_git_prompt_char_cleanstate '✔'
set -g __fish_git_prompt_char_dirtystate '𝚫'
set -g __fish_git_prompt_char_invalidstate 'x'
set -g __fish_git_prompt_char_stagedstate '●'
set -g __fish_git_prompt_char_untrackedfiles '+'
set -g __fish_git_prompt_char_upstream_behind ' ⬇ '
set -g __fish_git_prompt_char_upstream_ahead ' ⬆ '
set -g __fish_git_prompt_char_stateseparator ' '

function fish_prompt
  set_color yellow
  printf '%s' (whoami)@(hostname)

  set_color green
  printf ' %s' (prompt_pwd)

  if test -d ".git"
    set_color blue
    printf ' %s' (__fish_git_prompt '%s')
  end

  set_color normal
  printf '> '
end

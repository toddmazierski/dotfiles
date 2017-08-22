# A workaround for Fish re-reading config for non-interactive execution:
# https://git.io/yj4KoA
if not status --is-interactive
  exit
end

# fundle
fundle plugin 'edc/bass'
fundle init

# rbenv
source (rbenv init -|psub)

# Default editor
set --export EDITOR "atom --wait"

# A workaround for Fish re-reading config for non-interactive execution:
# https://git.io/yj4KoA
if not status --is-interactive
  exit
end

# fundle
fundle plugin 'edc/bass'
fundle plugin 'brgmnn/fish-docker-compose'
fundle init

# rbenv
if which rbenv > /dev/null
  source (rbenv init -|psub)
end

# pyenv
if which pyenv > /dev/null
  source (pyenv init -|psub)
end

# Default editor
set --export EDITOR "code --wait"

# Go
set --export GOPATH ~/code/go
set PATH ~/code/go/bin $PATH

# A workaround for Fish re-reading config for non-interactive execution:
# https://git.io/yj4KoA
if not status --is-interactive
  exit
end

# fundle
fundle plugin 'edc/bass'
fundle plugin 'brgmnn/fish-docker-compose'
fundle init

if which rbenv > /dev/null 2>&1
  source (rbenv init -|psub)
end

if which pyenv > /dev/null 2>&1
  source (pyenv init -|psub)
end

if which nodenv > /dev/null 2>&1
  source (nodenv init -|psub)
end

# Default editor
set --export EDITOR "code --wait"

# Go
if which go > /dev/null 2>&1; and test -z "$GOPATH"
  set --export GOPATH ~/code/go
  set PATH $PATH ~/code/go/bin
end

# ImageMagick
if test -d /usr/local/opt/imagemagick@6
  set PATH $PATH "/usr/local/opt/imagemagick@6/bin"
end

# Personal bin scripts
if test -d $HOME/bin
  set PATH $PATH $HOME/bin
end

# Rust
if test -d $HOME/.cargo/bin
  set PATH $PATH $HOME/.cargo/bin
end

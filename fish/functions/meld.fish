function meld
  open -W -a Meld --args (realpath $argv[1]) (realpath $argv[2])
end

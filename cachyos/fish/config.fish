source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fish_add_path ~/.local/bin

starship init fish | source

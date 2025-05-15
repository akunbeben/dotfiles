source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

alias q="exit"
alias c="clear"
alias l="ls -lah"
alias a="php artisan $argv"
alias vim="nvim $argv"
alias vimconf="vim ~/.config/nvim"
alias install="sudo pacman -S $argv"

set -gx PATH $HOME/.config/composer/vendor/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

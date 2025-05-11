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

set -gx PATH $HOME/.config/composer/vendor/bin $PATH

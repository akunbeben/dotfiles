function fish_greeting
    fastfetch
end
funcsave fish_greeting

alias q="exit"
alias c="clear"
alias l="ls -lah"
alias vim="nvim $argv"
alias vimconf="vim ~/.config/nvim"
alias install="sudo pacman -S $argv"

abbr a php artisan

# Git aliases
abbr g git
abbr ga 'git add'
abbr gaa 'git add .'
abbr gb 'git branch'
abbr gc 'git commit -m'
abbr gco 'git checkout'
abbr gcb 'git checkout -b'
abbr gd 'git diff'
abbr gl 'git pull'
abbr glog 'git log --oneline --graph --decorate'
abbr gp 'git push'
abbr gpf 'git push --force'
abbr gst 'git status'
abbr gr 'git remote -v'
abbr grm 'git rm'
abbr gcl 'git clone'
abbr gpl 'git pull origin'
abbr gps 'git push origin'
abbr gsw 'git switch'
abbr gss 'git stash save'
abbr gsp 'git stash pop'
abbr gsta 'git stash'
abbr gstl 'git stash list'
abbr gsts 'git stash show -p'

abbr cdd 'cd -'
abbr home 'cd ~'
abbr root 'cd /'
abbr docs 'cd ~/Documents'
abbr dl 'cd ~/Downloads'
abbr desk 'cd ~/Desktop'
abbr proj 'cd ~/Projects'
abbr src 'cd ~/src'
abbr ..1 'cd ..'
abbr ..2 'cd ../..'
abbr ..3 'cd ../../..'
abbr ..4 'cd ../../../..'
abbr ..5 'cd ../../../../..'

abbr shadcn 'bunx --bun shadcn@latest add'

set -gx PATH $HOME/.config/composer/vendor/bin $PATH
set -gx PATH $HOME/.config/fvm/bin $PATH
set -gx PATH $HOME/Projects/scripting $PATH

set -U fish_user_paths /opt/nvim-linux-x86_64/bin $fish_user_paths
set -U fish_user_paths /usr/local/go/bin $fish_user_paths

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

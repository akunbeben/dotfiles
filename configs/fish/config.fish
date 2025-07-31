alias q="exit"
alias c="clear"
alias l="eza --long --icons"
alias vim="nvim $argv"
alias vimconf="vim ~/.config/nvim"
alias install="sudo apt install $argv"
alias uninstall="sudo apt remove --purge $argv && sudo apt autoremove --purge -y"
alias ls="eza --long --icons --group-directories-first $argv"
alias ll="eza --long --icons --group-directories-first --all $argv"
alias ai="claude"

abbr a php artisan
abbr va valet php artisan
abbr migrate php artisan migrate
abbr rollback php artisan migrate:rollback
abbr model php artisan make:model
abbr controller php artisan make:controller
abbr request php artisan make:request
abbr event php artisan make:event
abbr listener php artisan make:listener
abbr job php artisan make:job
abbr seeder php artisan make:seeder

# Git aliases
abbr rf 'exec fish'
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
set -U fish_user_paths /home/ben/go/bin $fish_user_paths

set -x SDKMAN_DIR $HOME/.sdkman
source $SDKMAN_DIR/bin/sdkman-init.fish

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set fish_greeting

envsource "$HOME/.env"

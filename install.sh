#!/bin/bash

curl -L https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh

nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.tmux \
	nixpkgs.bat \
	nixpkgs.stow \
	nixpkgs.bun \
	nixpkgs.php82 \
	nixpkgs.php82Packages.composer

stow zsh
stow scripts

command -v zsh | sudo tee -a /etc/shells

sudo /bin/cp -f ./chsh /etc/pam.d/chsh

sudo chsh -s $(which zsh) $(whoami)

antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

ssh-keygen -t ed25519 -C "akunbeben@gmail.com" -f "$HOME/.ssh/github_personal" <<< ""
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/github_personal"

ssh-keygen -t ed25519 -C "akunbeben@gmail.com" -f "$HOME/.ssh/gitlab_personal" <<< ""
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/gitlab_personal"

ssh-keygen -t ed25519 -C "benny.rahmat@thrive.co.id" -f "$HOME/.ssh/gitlab_work" <<< ""
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/gitlab_work"

composer global require cpriego/valet-linux

# Install Nix
curl -L https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh

nix-env -iA \
	nixpkgs.antibody \
	nixpkgs.tmux \
	nixpkgs.bat \
	nixpkgs.stow \
	nixpkgs.bun \
	nixpkgs.php82 \
	nixpkgs.vscode \
	nixpkgs.php82Packages.composer

command -v zsh | sudo tee -a /etc/shells

sudo chsh -s $(which zsh) $(whoami)

antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $SCRIPT_DIR/helper.sh

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

run_command "pacman -S --noconfirm waybar" "Install Waybar - Status Bar" "yes"
run_command "safe_symlink /home/$SUDO_USER/dotfiles/configs/waybar /home/$SUDO_USER/.config/waybar" "Symlink Waybar config (force)" "yes" "no"

run_command "yay -S --sudoloop --noconfirm tofi" "Install Tofi - Application Launcher" "yes" "no"
run_command "safe_symlink /home/$SUDO_USER/dotfiles/configs/tofi /home/$SUDO_USER/.config/tofi" "Symlink Tofi config (force)" "yes" "no"

run_command "pacman -S --noconfirm cliphist" "Install Cliphist - Clipboard Manager" "yes"

run_command "yay -S --sudoloop --noconfirm swww" "Install SWWW for wallpaper management" "yes" "no"
run_command "mkdir -p /home/$SUDO_USER/.config/assets" "Ensure assets directory exists" "yes" "no"
run_command "safe_symlink /home/$SUDO_USER/dotfiles/assets/backgrounds /home/$SUDO_USER/.config/assets/backgrounds" "Symlink backgrounds (force)" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hyprpicker" "Install Hyprpicker - Color Picker" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hyprlock" "Install Hyprlock - Screen Locker (Must)" "yes" "no"
run_command "mkdir -p /home/$SUDO_USER/.config/hypr" "Ensure hypr config directory exists" "yes" "no"
run_command "safe_symlink /home/$SUDO_USER/dotfiles/configs/hypr/hyprlock.conf /home/$SUDO_USER/.config/hypr/hyprlock.conf" "Symlink Hyprlock config (force)" "yes" "no"

run_command "yay -S --sudoloop --noconfirm wlogout" "Install Wlogout - Session Manager" "yes" "no"
run_command "safe_symlink /home/$SUDO_USER/dotfiles/configs/wlogout /home/$SUDO_USER/.config/wlogout" "Symlink Wlogout config (force)" "yes" "no"
run_command "safe_symlink /home/$SUDO_USER/dotfiles/assets/wlogout /home/$SUDO_USER/.config/assets/wlogout" "Symlink Wlogout assets (force)" "yes" "no"

run_command "yay -S --sudoloop --noconfirm grimblast" "Install Grimblast - Screenshot tool" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hypridle" "Install Hypridle for idle management (Must)" "yes" "no"
run_command "safe_symlink /home/$SUDO_USER/dotfiles/configs/hypr/hypridle.conf /home/$SUDO_USER/.config/hypr/hypridle.conf" "Symlink Hypridle config (force)" "yes" "no"

run_command "pacman -S --noconfirm --needed bluez bluez-utils blueman" "Install Bluetooth packages (bluez, bluez-utils, blueman)" "yes"
run_command "systemctl enable --now bluetooth.service" "Enable and start Bluetooth service" "yes"

run_command "safe_symlink /home/$SUDO_USER/dotfiles/.wezterm.lua /home/$SUDO_USER/.wezterm.lua" "Symlink WezTerm config (force)" "yes" "no"
run_command "safe_symlink /home/$SUDO_USER/dotfiles/.tmux.conf /home/$SUDO_USER/.tmux.conf" "Symlink Tmux config (force)" "yes" "no"
run_command "safe_symlink /home/$SUDO_USER/dotfiles/configs/fish /home/$SUDO_USER/.config/fish" "Symlink Fish shell config (force)" "yes" "no"

run_command "usermod -aG lp $USER" "Add current user to 'lp' group for Bluetooth permissions" "yes"

echo "------------------------------------------------------------------------"

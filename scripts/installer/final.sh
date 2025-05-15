#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source helper file
source $SCRIPT_DIR/helper.sh

print_success "\nEnjoy your new Hyprland environment!"

echo "------------------------------------------------------------------------"

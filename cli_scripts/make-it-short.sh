#!/usr/bin/env bash
# Description: Create shell aliases for all CLI scripts in the dotfiles
# This script is sourced by .zshrc to make all scripts available as @command-name

# Get the script directory
script_dir="$HOME/dotfiles/cli_scripts/src"

# Get the current operating system
current_os=$(uname -s | tr '[:upper:]' '[:lower:]')

# Set the directory based on the operating system
case "$current_os" in
    linux)
        script_extended_dir="$script_dir/linux"
        ;;
    darwin)
        script_extended_dir="$script_dir/macos"
        ;;
    *)
        # Instead of echoing an error, set a variable to indicate the error
        unsupported_os=true
        ;;
esac

# If you need to handle the unsupported OS case, you can check the variable:
if [ "${unsupported_os:-false}" = true ]; then
    # Handle the error condition without I/O
    # For example, you could set a default directory or exit the script
    script_extended_dir="$script_dir/unknown"
    # or
    # exit 1
fi

# Function to create aliases for all *.sh files in the script directory
create_aliases() {
    # Create aliases for all *.sh files in the script directory
    for script_file in "$script_dir"/*.sh; do
        if [ -f "$script_file" ]; then
            script_name=$(basename "$script_file" .sh)
            alias "@$script_name"="source $script_file"
        fi
    done

    # Create aliases specially by operating system
    for script_file in "$script_extended_dir"/*.sh; do
        if [ -f "$script_file" ]; then
            script_name=$(basename "$script_file" .sh)
            alias "@$script_name"="source $script_file"
        fi
    done
}

# Create aliases
create_aliases

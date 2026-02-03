#!/usr/bin/env bash
# Description: Reload zsh configuration by sourcing ~/.zshrc
# Usage: zshrc [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Reloads the zsh configuration by sourcing ~/.zshrc"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if no arguments provided
if [ "$#" -ne 0 ]; then
    echo "Error: This script does not take arguments" >&2
    display_help
fi

# Source the ~/.zshrc file
echo "Reloading zsh configuration..."
source ~/.zshrc
echo "Done!"

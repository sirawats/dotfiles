#!/usr/bin/env bash
# Description: Initialize conda environment
# Usage: conda [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Initializes conda by sourcing the activate script"
    echo "  Supports miniconda3, anaconda3, and system-wide conda installations"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
    exit 0
fi

# Check if no arguments provided
if [ "$#" -ne 0 ]; then
    echo "Error: This script does not take arguments" >&2
    display_help
    exit 1
fi

# Try common conda locations
if [ -f "$HOME/miniconda3/bin/activate" ]; then
    source "$HOME/miniconda3/bin/activate"
    echo "Conda activated from ~/miniconda3!"
elif [ -f "$HOME/anaconda3/bin/activate" ]; then
    source "$HOME/anaconda3/bin/activate"
    echo "Conda activated from ~/anaconda3!"
elif command -v conda &> /dev/null; then
    eval "$(conda shell.bash hook)"
    echo "Conda activated from system installation!"
else
    echo "Error: Conda installation not found" >&2
    echo "Searched locations:" >&2
    echo "  - ~/miniconda3/bin/activate" >&2
    echo "  - ~/anaconda3/bin/activate" >&2
    echo "  - System PATH" >&2
    exit 1
fi


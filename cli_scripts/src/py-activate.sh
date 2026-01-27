#!/usr/bin/env bash
# Description: Activate a Python virtual environment
# Usage: py-activate [virtualenv_path]

# Function to display help message
display_help() {
    echo "Usage: $0 [virtualenv_path]"
    echo "  [virtualenv_path]: The path to the Python virtual environment to activate"
    echo "                     If not provided, activates '.venv' or 'venv' in current directory"
    echo "  help|-h|--help: Display this help message"
}

# Check if the first argument is 'help'
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
    exit 0
fi

# Check if the number of arguments is correct
if [ "$#" -gt 1 ]; then
    echo "Error: Too many arguments" >&2
    display_help
    exit 1
fi

# If no argument is provided, default to '.venv' or 'venv' in the current directory
if [ "$#" -eq 0 ]; then
    if [ -d ".venv" ]; then
        virtualenv_path=".venv"
    elif [ -d "venv" ]; then
        virtualenv_path="venv"
    else
        echo "Error: No virtual environment specified, and '.venv' or 'venv' not found in the current directory."
        display_help
    fi
else
    virtualenv_path="$1"
fi

# Activate the Python virtual environment
activate_script="$virtualenv_path/bin/activate"
echo "Activating Python virtual environment at: $activate_script"
source "$activate_script"

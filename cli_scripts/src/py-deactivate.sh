#!/usr/bin/env bash
# Description: Deactivate the current Python virtual environment
# Usage: py-deactivate [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Deactivates the current Python virtual environment"
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

# Deactivate the Python virtual environment
echo "Deactivating Python virtual environment."
deactivate

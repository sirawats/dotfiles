#!/usr/bin/env bash
# Description: Start SSH agent and display environment variables
# Usage: ssh-check-local-agent [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Starts the SSH agent and displays environment variables"
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

eval "$(ssh-agent -s)"



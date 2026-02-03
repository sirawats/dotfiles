#!/usr/bin/env bash
# Description: Generate a UUID (Universally Unique Identifier)
# Usage: gen-uuid [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Generates a random UUID"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if the number of arguments is correct
if [ "$#" -ne 0 ]; then
    echo "Error: This script does not take arguments" >&2
    display_help
fi

uuidgen


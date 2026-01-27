#!/usr/bin/env bash
# Description: Generate a random password with specified length (default: 24)
# Usage: gen-pw [password-length]

# Function to display help message
display_help() {
    echo "Usage: $0 [password-length]"
    echo "  [password-length]: Number of characters in the password (1-1024)"
    echo "                     Default: 24 characters"
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

# Default to 24 characters if no argument provided
length="${1:-24}"

# Validate that argument is a positive integer between 1 and 1024
if ! [[ "$length" =~ ^[0-9]+$ ]] || [ "$length" -lt 1 ] || [ "$length" -gt 1024 ]; then
    echo "Error: Password length must be a number between 1 and 1024" >&2
    exit 1
fi

LC_CTYPE=C && LANG=C && tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c "$length"
echo ""  # Add newline at the end

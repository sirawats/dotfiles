#!/usr/bin/env bash
# Description: Encode text to base64
# Usage: encode-base64 <text>

# Function to display help message
display_help() {
    echo "Usage: $0 <text>"
    echo "  <text>: Text to encode to base64"
    echo "  help|-h|--help: Display this help message"
    echo ""
    echo "Examples:"
    echo "  $0 'Hello World'"
    echo "  echo 'Hello World' | $0"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if input is from pipe or argument
if [ -p /dev/stdin ]; then
    # Input from pipe
    base64
elif [ "$#" -eq 1 ]; then
    # Input from argument
    echo -n "$1" | base64
else
    echo "Error: Provide text as argument or via pipe" >&2
    display_help
fi

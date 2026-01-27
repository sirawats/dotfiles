#!/usr/bin/env bash
# Description: Decode base64 to text
# Usage: decode-base64 <base64-text>

# Function to display help message
display_help() {
    echo "Usage: $0 <base64-text>"
    echo "  <base64-text>: Base64 encoded text to decode"
    echo "  help|-h|--help: Display this help message"
    echo ""
    echo "Examples:"
    echo "  $0 'SGVsbG8gV29ybGQ='"
    echo "  echo 'SGVsbG8gV29ybGQ=' | $0"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
    exit 0
fi

# Check if input is from pipe or argument
if [ -p /dev/stdin ]; then
    # Input from pipe
    base64 -d
elif [ "$#" -eq 1 ]; then
    # Input from argument
    echo -n "$1" | base64 -d
    echo ""  # Add newline
else
    echo "Error: Provide base64 text as argument or via pipe" >&2
    display_help
    exit 1
fi

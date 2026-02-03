#!/usr/bin/env bash
# Description: Decode URL-encoded strings
# Usage: url-decode <url>

# Function to display help message
display_help() {
    echo "Usage: $0 <url>"
    echo "  <url>: URL-encoded text to decode"
    echo "  help|-h|--help: Display this help message"
}

# URL decode function
function urldecode() { 
    : "${*//+/ }"
    echo -e "${_//%/\\x}"
}

# Check if the first argument is 'help'
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Error: Invalid number of arguments" >&2
    display_help
fi

# Decode the URL
urldecode "$1"



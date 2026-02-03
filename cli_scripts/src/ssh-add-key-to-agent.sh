#!/usr/bin/env bash
# Description: Add SSH private key to the SSH agent
# Usage: ssh-add-key-to-agent <ssh_key_path>

# Function to display help message
display_help() {
    echo "Usage: $0 <ssh_key_path>"
    echo "  <ssh_key_path>: Path to SSH private key file"
    echo "  help|-h|--help: Display this help message"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Error: SSH key path is required" >&2
    display_help
fi

# Check if the key file exists
if [ ! -f "$1" ]; then
    echo "Error: Key file '$1' not found" >&2
fi

ssh-add "$1"

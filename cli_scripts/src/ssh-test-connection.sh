#!/usr/bin/env bash
# Description: Test SSH connection to a remote host
# Usage: ssh-test-connection <hostname>

# Function to display help message
display_help() {
    echo "Usage: $0 <hostname>"
    echo "  <hostname>: SSH hostname or user@hostname to test connection"
    echo "  help|-h|--help: Display this help message"
    echo ""
    echo "Examples:"
    echo "  $0 git@github.com"
    echo "  $0 user@example.com"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Error: Hostname is required" >&2
    display_help
fi

ssh -T "$1"

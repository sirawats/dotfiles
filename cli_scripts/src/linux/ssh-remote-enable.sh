#!/usr/bin/env bash
# Description: Enable SSH remote login on Linux
# Usage: ssh-remote-enable [help|-h|--help]

display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Enables SSH remote login by starting the SSH service"
}

# Check for help flag
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if no arguments provided
if [ "$#" -ne 0 ]; then
    echo "Error: This script does not take arguments" >&2
    display_help
fi

echo "Enabling SSH remote login..."
sudo systemctl start ssh

#!/usr/bin/env bash
# Description: Disable SSH remote login on Linux
# Usage: ssh-remote-disable [help|-h|--help]

display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Disables SSH remote login by stopping the SSH service"
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

echo "Disabling SSH remote login..."
sudo systemctl stop ssh

#!/usr/bin/env bash
# Description: Enable SSH remote login on macOS
# Usage: ssh-remote-enable [help|-h|--help]

display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Enables SSH remote login on macOS"
}

# Check for help flag
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

echo "Enabling SSH remote login..."
sudo systemsetup -setremotelogin on

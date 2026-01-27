#!/usr/bin/env bash
# Description: Disable SSH remote login on macOS
# Usage: ssh-remote-disable [help|-h|--help]

display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Disables SSH remote login on macOS"
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

echo "Disabling SSH remote login..."
sudo systemsetup -setremotelogin off

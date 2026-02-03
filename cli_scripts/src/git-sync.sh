#!/usr/bin/env bash
# Description: Sync with remote - fetch, pull, and prune in one command
# Usage: git-sync [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Syncs current branch with remote:"
    echo "    - Fetches all remotes"
    echo "    - Pulls current branch"
    echo "    - Prunes deleted remote branches"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if no arguments provided
if [ "$#" -ne 0 ]; then
    echo "Error: This script does not take arguments" >&2
    display_help
fi

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository" >&2
fi

echo "Syncing with remote..."
echo ""

# Fetch all remotes with prune
echo "→ Fetching all remotes and pruning..."
git fetch --all --prune

echo ""
echo "→ Pulling current branch..."
git pull

echo ""
echo "✓ Sync complete!"

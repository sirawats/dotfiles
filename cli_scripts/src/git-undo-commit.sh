#!/usr/bin/env bash
# Description: Undo last commit but keep changes staged
# Usage: git-undo-commit [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Undoes the last commit but keeps changes staged"
    echo "  Useful when you committed too early or made a mistake"
    echo ""
    echo "Note: This only affects your local repository"
}

# Check if the first argument is help
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

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository" >&2
    exit 1
fi

# Check if there are any commits
if ! git rev-parse HEAD > /dev/null 2>&1; then
    echo "Error: No commits to undo" >&2
    exit 1
fi

# Show the commit that will be undone
echo "Undoing last commit:"
git log -1 --oneline
echo ""

# Undo the commit
git reset --soft HEAD~1

echo "✓ Commit undone. Changes are still staged."

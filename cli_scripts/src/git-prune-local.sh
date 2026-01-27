#!/usr/bin/env bash
# Description: Remove local Git branches that have been merged and deleted from remote
# Usage: git-prune-local [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Removes local Git branches that have been merged and deleted from remote"
    echo "  This script will show you what will be deleted and ask for confirmation"
    echo "  Thanks to https://stackoverflow.com/questions/13064613/how-to-prune-local-tracking-branches-that-do-not-exist-on-remote-anymore"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
    exit 0
fi

# Check if the number of arguments is correct
if [ "$#" -gt 0 ]; then
    echo "Error: This script does not take arguments" >&2
    display_help
    exit 1
fi

# Fetch and prune remote branches
echo "Fetching and pruning remote branches..."
git fetch -p

# Get list of branches to delete
branches_to_delete=$(git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}')

if [ -z "$branches_to_delete" ]; then
    echo "No merged local branches to remove."
    exit 0
fi

# Show what will be deleted
echo "The following local branches will be deleted:"
echo "$branches_to_delete"
echo ""

# Ask for confirmation
read -p "Do you want to continue? (y/N) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Removing merged local branches..."
    echo "$branches_to_delete" | xargs git branch -d
    echo "Done!"
else
    echo "Operation cancelled."
    exit 0
fi

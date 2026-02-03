#!/usr/bin/env bash
set -euo pipefail

# Description: Remove local Git branches that have been merged and deleted from remote
# Usage: git-prune-local [help|-h|--help]

# Function to display help message
display_help() {
  echo "Usage: $0 [help|-h|--help]"
  echo "  Removes local Git branches that have been merged and deleted from remote"
  echo "  Uses 'git branch -vv' and 'git branch -r' to identify candidates."
  echo "  "
  echo "  This script will show you what will be deleted and ask for confirmation"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
  display_help
else
  # Fetch and prune remote branches
  echo "Fetching and pruning remote branches..."
  git fetch --prune

  # Get list of branches to delete using logic from StackOverflow
  # 1. Get remote branches
  # 2. Filter local tracking branches (grep origin)
  # 3. Exclude those where the tracking branch still exists in remote list
  # 4. Print local branch name
  branches_to_delete=$(git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}')

  if [ -z "$branches_to_delete" ]; then
    echo "No merged local branches to remove."
  else
    # Show what will be deleted
    echo "The following local branches will be deleted:"
    echo "$branches_to_delete"
    echo ""

    # Ask for confirmation
    read -p "Do you want to continue? (y/N) " -n 1 -r
    echo ""

    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo "Removing branches..."
      echo "$branches_to_delete" | xargs git branch -d
      echo "Done!"
    else
      echo "Operation cancelled."
    fi
  fi
fi

#!/usr/bin/env bash
# Description: Recursively remove Python cache files and directories
# Usage: py-clean [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Recursively removes all Python cache files (__pycache__, *.pyc, *.pyo) in current directory"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if the number of arguments is correct
if [ "$#" -gt 0 ]; then
    echo "Error: This script does not take arguments" >&2
    display_help
fi

# Show what will be deleted
echo "Searching for Python cache files in current directory..."
cache_files=$(find . -type f -name '*.py[co]' -o -type d -name __pycache__)

if [ -z "$cache_files" ]; then
    echo "No Python cache files found."
fi

echo "The following will be deleted:"
echo "$cache_files"
echo ""

# Ask for confirmation
read -p "Do you want to continue? (y/N) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Removing Python cache files..."
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
    echo "Done!"
else
    echo "Operation cancelled."
fi



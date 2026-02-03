#!/usr/bin/env bash
# Description: Clean and reinstall npm dependencies
# Usage: npm-clean [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Removes node_modules and package-lock.json, then reinstalls"
    echo "  Useful for fixing dependency issues"
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

# Check if package.json exists
if [ ! -f "package.json" ]; then
    echo "Error: No package.json found in current directory" >&2
fi

echo "Cleaning npm dependencies..."
echo ""

# Remove node_modules
if [ -d "node_modules" ]; then
    echo "→ Removing node_modules..."
    rm -rf node_modules
else
    echo "→ No node_modules directory found"
fi

# Remove package-lock.json
if [ -f "package-lock.json" ]; then
    echo "→ Removing package-lock.json..."
    rm -f package-lock.json
else
    echo "→ No package-lock.json found"
fi

echo ""
echo "→ Reinstalling dependencies..."
npm install

echo ""
echo "✓ Clean install complete!"

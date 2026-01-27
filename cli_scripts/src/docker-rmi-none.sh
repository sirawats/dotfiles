#!/usr/bin/env bash
# Description: Remove dangling Docker images
# Usage: docker-rmi-none [help|-h|--help]

# Function to display help message
display_help() {
    echo "Usage: $0 [help|-h|--help]"
    echo "  Removes dangling Docker images (images with <none> tag)"
    echo "  This script will show you what will be deleted and ask for confirmation"
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

# Get list of dangling images
dangling_images=$(docker images -a --filter "dangling=true" -q --no-trunc)

if [ -z "$dangling_images" ]; then
    echo "No dangling images found."
    exit 0
fi

# Show what will be deleted
echo "The following dangling images will be removed:"
docker images -a --filter "dangling=true"
echo ""

# Ask for confirmation
read -p "Do you want to continue? (y/N) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Removing dangling Docker images..."
    docker rmi $dangling_images
    echo "Done!"
else
    echo "Operation cancelled."
    exit 0
fi

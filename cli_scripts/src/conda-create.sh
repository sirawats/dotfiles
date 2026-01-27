#!/usr/bin/env bash
# Description: Create a new Conda environment with specified Python version
# Usage: conda-create <prefix_directory> <python_version>

# Function to display help message
display_help() {
    echo "Usage: $0 <prefix_directory> <python_version>"
    echo "  <prefix_directory>: The directory where the conda environment will be created"
    echo "  <python_version>: The Python version for the conda environment (e.g., 3.9, 3.10)"
    echo "  help|-h|--help: Display this help message"
}

# Check if the first argument is 'help'
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
    exit 0
fi

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Error: Invalid number of arguments" >&2
    display_help
    exit 1
fi

# Assign arguments to variables
prefix_directory="$1"
python_version="$2"

# Create conda environment
echo "Creating conda environment in $prefix_directory with Python $python_version"
conda create --prefix "$prefix_directory" python="$python_version"




#!/usr/bin/env bash
# Description: Pretty-print JSON from file or stdin
# Usage: json-pretty [file]

# Function to display help message
display_help() {
    echo "Usage: $0 [file]"
    echo "  [file]: JSON file to pretty-print (optional)"
    echo "          If not provided, reads from stdin"
    echo "  help|-h|--help: Display this help message"
    echo ""
    echo "Examples:"
    echo "  $0 data.json"
    echo "  echo '{\"key\":\"value\"}' | $0"
    echo "  curl -s https://api.example.com/data | $0"
}

# Check if the first argument is help
if [[ "${1:-}" == "help" ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
    display_help
fi

# Check if too many arguments
if [ "$#" -gt 1 ]; then
    echo "Error: Too many arguments" >&2
    display_help
fi

# Determine which JSON tool to use
if command -v jq &> /dev/null; then
    # Use jq if available (best option)
    json_tool="jq ."
elif command -v python3 &> /dev/null; then
    # Use Python's json.tool as fallback
    json_tool="python3 -m json.tool"
elif command -v python &> /dev/null; then
    # Use Python 2 as last resort
    json_tool="python -m json.tool"
else
    echo "Error: No JSON formatter found (jq or python required)" >&2
fi

# Process input
if [ "$#" -eq 0 ]; then
    # Read from stdin
    eval "$json_tool"
else
    # Read from file
    if [ ! -f "$1" ]; then
        echo "Error: File '$1' not found" >&2
    fi
    cat "$1" | eval "$json_tool"
fi

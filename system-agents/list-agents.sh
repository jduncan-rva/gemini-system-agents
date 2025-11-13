#!/bin/bash

# List available Gemini system agents with their descriptions

AGENTS_DIR="$HOME/.gemini/system-agents"
AGENTS_JSON="$AGENTS_DIR/agents.json"

if [ ! -f "$AGENTS_JSON" ]; then
    echo "Error: agents.json not found at $AGENTS_JSON"
    echo "Make sure the system-agent-installer extension is installed."
    exit 1
fi

# Check if jq is available for pretty formatting
if command -v jq &> /dev/null; then
    echo "Available Gemini System Agents:"
    echo "================================"
    echo

    # Use jq to format the output nicely
    jq -r '.agents[] | "[\(.id)]
  Name: \(.name)
  File: \(.file)
  Category: \(.category)
  Description: \(.description)

  Usage: export GEMINI_SYSTEM_MD=~/.gemini/system-agents/\(.file)
  "' "$AGENTS_JSON"
else
    # Fallback: just list the files if jq is not available
    echo "Available Gemini System Agents:"
    echo "================================"
    echo
    ls -1 "$AGENTS_DIR"/*.md 2>/dev/null | while read -r file; do
        basename "$file"
    done
    echo
    echo "Install 'jq' for detailed agent information: brew install jq"
fi

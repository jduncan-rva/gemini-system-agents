#!/bin/bash

# Compare Gemini system agents

AGENTS_DIR="$HOME/.gemini/extensions/system-agents/system-agents"
AGENTS_JSON="$AGENTS_DIR/agents.json"

if [ ! -f "$AGENTS_JSON" ]; then
    echo "Error: agents.json not found at $AGENTS_JSON"
    echo "Make sure the system-agents extension is installed."
    exit 1
fi

if [ -z "$1" ]; then
    # If no arguments, provide general guidance
    jq -r '.categories | to_entries[] | "Category: \(.key) - \(.value.name)\n\(.value.description)\n"' "$AGENTS_JSON"
else
    # If arguments are provided, compare the specified agents
    echo "Comparing agents: $@"
    echo "================================"
    for agent_id in "$@"; do
        jq -r --arg id "$agent_id" '.agents[] | select(.id == $id) | "[\(.id)]\n  Name: \(.name)\n  File: \(.file)\n  Category: \(.category)\n  Description: \(.description)\n  Use Cases: \(.use_cases | join(", "))\n  Personality: \(.personality)\n  Outputs: \(.outputs)\n\n  Usage: export GEMINI_SYSTEM_MD=~/.gemini/extensions/system-agents/system-agents/\(.file)\n  "' "$AGENTS_JSON"
    done
fi

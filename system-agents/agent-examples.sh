#!/bin/bash

# Show examples for Gemini system agents

AGENTS_DIR="$HOME/.gemini/extensions/system-agents/system-agents"
AGENTS_JSON="$AGENTS_DIR/agents.json"

if [ ! -f "$AGENTS_JSON" ]; then
    echo "Error: agents.json not found at $AGENTS_JSON"
    echo "Make sure the system-agents extension is installed."
    exit 1
fi

if [ -z "$1" ]; then
    # If no arguments, provide general guidance
    jq -r '.agents[] | "Agent: \(.name)\n  Description: \(.description)\n  Use Cases: \(.use_cases | join(", "))\n"' "$AGENTS_JSON"
else
    # If arguments are provided, show examples for the specified agents
    echo "Examples for agent: $1"
    echo "==============================="
    jq -r --arg id "$1" '.agents[] | select(.id == $id) | "Agent: \(.name)
  Description: \(.description)
  Use Cases: \(.use_cases | join(", "))
  Personality: \(.personality)
  Outputs: \(.outputs)

  Usage: export GEMINI_SYSTEM_MD=~/.gemini/extensions/system-agents/system-agents/\(.file)
  "' "$AGENTS_JSON"
fi


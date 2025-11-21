#!/bin/bash

# Show detailed information about a specific Gemini system agent

AGENTS_DIR="$HOME/.gemini/extensions/system-agents/system-agents"
AGENTS_JSON="$AGENTS_DIR/agents.json"

if [ ! -f "$AGENTS_JSON" ]; then
    echo "Error: agents.json not found at $AGENTS_JSON"
    echo "Make sure the system-agents extension is installed."
    exit 1
fi

if [ -z "$1" ]; then
    echo "Error: Please provide an agent ID."
    echo "Available agent IDs:"
    jq -r '.agents[] | .id' "$AGENTS_JSON"
    exit 1
fi

AGENT_INFO=$(jq -r --arg id "$1" '.agents[] | select(.id == $id)' "$AGENTS_JSON")

if [ -z "$AGENT_INFO" ]; then
    echo "Error: Agent with ID '$1' not found."
    echo "Available agent IDs:"
    jq -r '.agents[] | .id' "$AGENTS_JSON"
    exit 1
fi

jq -r --arg id "$1" '.agents[] | select(.id == $id) | "Agent Name: \(.name) (\(.id))
Description: \(.description)
Category: \(.category)
Use Cases: \(.use_cases | join(", "))
Personality: \(.personality)
Expected Outputs: \(.outputs)

To activate this agent:
   export GEMINI_SYSTEM_MD=~/.gemini/extensions/system-agents/system-agents/\(.file)
   gemini
"' "$AGENTS_JSON"

echo
echo "Remember: Agent changes require starting a new Gemini session."

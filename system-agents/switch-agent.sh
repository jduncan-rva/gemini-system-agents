#!/bin/bash

# Show how to switch to a different Gemini system agent

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

AGENT_FILE=$(echo "$AGENT_INFO" | jq -r '.file')
AGENT_NAME=$(echo "$AGENT_INFO" | jq -r '.name')
AGENT_DESCRIPTION=$(echo "$AGENT_INFO" | jq -r '.description')

echo "To switch to the '$AGENT_NAME' agent:"
echo "========================================="
echo "Description: $AGENT_DESCRIPTION"
echo
echo "Instructions:"
echo "1. Exit this Gemini session first (Ctrl+D or type 'exit')."
echo "2. Then, in your terminal, run the following commands:"
echo "   export GEMINI_SYSTEM_MD=~/.gemini/extensions/system-agents/system-agents/$AGENT_FILE"
echo "   gemini"
echo
echo "What to expect:"
echo "When using the '$AGENT_NAME' agent, you can expect responses tailored to its unique personality and expertise."
echo
echo "Sample prompt you could try:"
if [ "$1" == "architect" ]; then
  echo "  - \"Design a scalable microservices architecture for an e-commerce platform.\""
elif [ "$1" == "code-generator" ]; then
  echo "  - \"Write a Python function to calculate the Fibonacci sequence up to N terms.\""
elif [ "$1" == "creative-writer" ]; then
  echo "  - \"Write a short story about a brave knight and a mischievous dragon.\""
elif [ "$1" == "comedian" ]; then
  echo "  - \"Tell me a joke about software bugs.\""
elif [ "$1" == "pirate" ]; then
  echo "  - \"How do I set up a Docker container, me hearty?\""
elif [ "$1" == "shakespeare" ]; then
  echo "  - \"Hark, explain to me the workings of a RESTful API.\""
elif [ "$1" == "yoda" ]; then
  echo "  - \"Refactor this code, how should I?\""
elif [ "$1" == "cowboy" ]; then
  echo "  - \"Howdy, pardner. How do I sort this array of numbers?\""
elif [ "$1" == "gen-z" ]; then
  echo "  - \"Help me debug this, it's giving major sus vibes.\""
else
  echo "  - \"Hello, world!\""
fi
echo
echo "IMPORTANT:"
echo "- You MUST exit the current Gemini session first."
echo "- The agent cannot be changed mid-session."
echo "- The environment variable only affects new Gemini sessions."
echo "- To return to the default agent, you can unset the environment variable or start a new Gemini session without it:"
echo "   unset GEMINI_SYSTEM_MD"
echo "   gemini"

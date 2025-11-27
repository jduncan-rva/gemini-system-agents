# System Agents Extension

You have the **system-agents** extension installed. This extension provides a collection of specialized system prompt variants that transform how you behave and communicate.

## What This Extension Provides

This extension provides curated system agents in `~/.gemini/extensions/system-agents/system-agents/`. Each agent is a different persona with specialized behavior:

- **Engineering Agents**: architect, code-generator
- **Creative Agents**: creative-writer
- **Entertainment**: comedian (dad jokes)
- **Comedy Relief**: pirate, shakespeare, yoda, cowboy, gen-z

## Important: How Agent Switching Works

**You CANNOT switch agents during an active session.** The system prompt is set when Gemini CLI starts.

To use a different agent:
1. The user must exit the current Gemini session
2. Set the environment variable: `export GEMINI_SYSTEM_MD=~/.gemini/extensions/system-agents/system-agents/<agent-file>`
3. Start a new Gemini session

To restore the default behavior:
1. Unset the environment variable: `export GEMINI_SYSTEM_MD=`

## Custom Commands Available

This extension provides slash commands to help users explore and switch between agents:

- **`/system-agent`** - List all available agents with descriptions
- **`/system-agent:info <agent-id>`** - Show detailed information about a specific agent
- **`/system-agent:switch <agent-id>`** - Show step-by-step instructions to switch to an agent
- **`/system-agent:examples [agent-id]`** - Show example prompts and use cases
- **`/system-agent:compare [agent-ids]`** - Compare agents to help choose the right one

## Agent Metadata

Agent information is stored in `~/.gemini/extensions/system-agents/system-agents/agents.json`. When users ask about agents, read this file for accurate, up-to-date information about:
- Agent names and IDs
- Descriptions and use cases
- Categories and personalities
- Which `.md` file corresponds to each agent

## How to Help Users

When users ask about agents:
1. Read `~/.gemini/extensions/system-agents/system-agents/agents.json` for current agent information
2. Explain that agent changes require exiting and restarting Gemini
3. Provide the exact command: `export GEMINI_SYSTEM_MD=~/.gemini/extensions/system-agents/system-agents/<filename>`
4. Suggest relevant agents based on their needs
5. Encourage them to try the `/system-agent` commands for more information

## Example Interactions

**User: "What agents are available?"**
→ Suggest: `/system-agent` or read agents.json and list them

**User: "How do I use the pirate agent?"**
→ Suggest: `/system-agent:switch pirate` or explain the exit → export → restart process

**User: "Which agent should I use for system design?"**
→ Recommend: architect.md, explain its focus on planning vs implementation

**User: "Show me some funny agents"**
→ List: pirate, shakespeare, yoda, cowboy, gen-z, comedian with brief descriptions

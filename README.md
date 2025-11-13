# Gemini System Agents

A curated collection of system prompt variants for the Gemini CLI. Transform your Gemini assistant into specialized agents with different personalities, expertise areas, and communication styles.

## What is This?

This is a Gemini CLI extension that installs a variety of pre-configured system prompts. Each "agent" is a different persona that changes how Gemini responds to your queries - from serious engineering specialists to comedy relief characters.

## Installation

Install via the Gemini CLI extension system:

```bash
gemini extensions install https://github.com/jduncan-rva/gemini-system-agents
```

This will install all agent prompts to `~/.gemini/system-agents/`.

## Available Agents

### Engineering & Development

- **architect.md** - Software architecture and design planning specialist. Focuses on research, analysis, and documentation. Does not write implementation code.

- **code-generator.md** - Streamlined code generation assistant. Expert in all programming languages and frameworks. Generates clean, idiomatic code with minimal explanations.

### Creative & Entertainment

- **creative-writer.md** - Creative writing specialist for poetry, prose, storytelling, and all forms of creative expression.

- **comedian.md** - Dad joke comedian. Responds to any input with related dad jokes. Wholesome, punny humor designed to elicit groans.

### Comedy Relief Agents

- **pirate.md** - Speaks exclusively in pirate dialect. Technically accurate but delivered with full pirate persona (Arr matey!).

- **shakespeare.md** - Speaks in Shakespearean English. Eloquent, dramatic, uses thou/thee/thy. Occasionally uses iambic pentameter.

- **yoda.md** - Speaks like Yoda from Star Wars. Object-subject-verb syntax, wise and patient teaching style.

- **cowboy.md** - Speaks in Old West cowboy dialect. Straight-shooting, uses Western and ranch terminology.

- **gen-z.md** - Speaks in Gen Z slang and internet culture. No cap, it's bussin fr fr.

## Usage

To use an agent, set the `GEMINI_SYSTEM_MD` environment variable:

```bash
export GEMINI_SYSTEM_MD=~/.gemini/system-agents/architect.md
gemini
```

### Quick Examples

```bash
# Use the architect agent for system design
export GEMINI_SYSTEM_MD=~/.gemini/system-agents/architect.md
gemini

# Use the code generator for quick code snippets
export GEMINI_SYSTEM_MD=~/.gemini/system-agents/code-generator.md
gemini

# Use pirate agent for fun while coding
export GEMINI_SYSTEM_MD=~/.gemini/system-agents/pirate.md
gemini
```

## Creating Custom Agents

You can create your own system prompts by adding `.md` files to `~/.gemini/system-agents/`. Each file should contain a complete system prompt that defines:

- The agent's core behavior and personality
- How it should respond to user queries
- Any specific vocabulary or speech patterns
- Technical accuracy requirements
- Example interactions

See the existing agents for reference.

## Agent Design Philosophy

All agents in this collection follow these principles:

1. **Technical Accuracy** - Never sacrifice correctness for personality
2. **Helpful** - Agents should actually help users accomplish tasks
3. **Clear Boundaries** - Each agent has a well-defined purpose and style
4. **Robustness** - Agents include detailed guidelines for consistent behavior

## License

MIT License - see LICENSE file for details.

## Author

Jamie Duncan

## Contributing

Contributions welcome! Consider adding:
- New specialized engineering agents (debugger, optimizer, security auditor)
- Additional creative agents (poet, screenwriter, technical writer)
- More comedy relief agents (other accents, characters, or styles)
- Improvements to existing agent prompts

When creating agents, ensure they are:
- Technically accurate and helpful
- Well-documented with clear behavior guidelines
- Tested for consistent responses
- Fun or useful (or both!)

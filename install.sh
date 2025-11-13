#!/bin/bash

GEMINI_DIR="$HOME/.gemini"
SYSTEM_AGENTS_DIR="$GEMINI_DIR/system-agents"

if [ ! -d "$GEMINI_DIR" ]; then
  mkdir "$GEMINI_DIR"
fi

if [ ! -d "$SYSTEM_AGENTS_DIR" ]; then
  mkdir "$SYSTEM_AGENTS_DIR"
fi

cp -r system-agents/* "$SYSTEM_AGENTS_DIR"

echo "System agents installed successfully!"

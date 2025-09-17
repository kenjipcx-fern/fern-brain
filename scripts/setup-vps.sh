#!/bin/bash

set -euo pipefail

echo "Ensuring fnm is installed..."

# Try to locate fnm in common paths or install if missing
FNM_BIN=""
if command -v fnm >/dev/null 2>&1; then
  FNM_BIN="$(command -v fnm)"
fi
if [ -z "$FNM_BIN" ] && [ -x "$HOME/.fnm/fnm" ]; then
  FNM_BIN="$HOME/.fnm/fnm"
fi
if [ -z "$FNM_BIN" ] && [ -x "$HOME/.local/share/fnm/fnm" ]; then
  FNM_BIN="$HOME/.local/share/fnm/fnm"
fi

if [ -z "$FNM_BIN" ]; then
  echo "Installing fnm..."
  curl -fsSL https://fnm.vercel.app/install | bash
  # Re-detect after install
  if command -v fnm >/dev/null 2>&1; then
    FNM_BIN="$(command -v fnm)"
  elif [ -x "$HOME/.fnm/fnm" ]; then
    FNM_BIN="$HOME/.fnm/fnm"
  elif [ -x "$HOME/.local/share/fnm/fnm" ]; then
    FNM_BIN="$HOME/.local/share/fnm/fnm"
  fi
fi

if [ -z "$FNM_BIN" ]; then
  echo "Error: fnm not found after installation. Please open a new shell and re-run." >&2
  exit 1
fi

# Ensure fnm directory is in PATH for this script execution
export PATH="$(dirname "$FNM_BIN"):$PATH"

echo "Installing Node.js v24 with fnm..."
"$FNM_BIN" install v24 || true
"$FNM_BIN" default v24 || true

echo "Enabling pnpm via corepack (scoped to Node v24)..."
"$FNM_BIN" exec --using v24 node -v
"$FNM_BIN" exec --using v24 npm -v || true
"$FNM_BIN" exec --using v24 corepack enable || true
if ! "$FNM_BIN" exec --using v24 corepack prepare pnpm@latest --activate; then
  echo "corepack prepare failed; falling back to npm -g pnpm install"
  "$FNM_BIN" exec --using v24 npm i -g pnpm
fi

echo "Verifying Node/npm/pnpm availability (Node v24)..."
"$FNM_BIN" exec --using v24 node -v
"$FNM_BIN" exec --using v24 npm -v
"$FNM_BIN" exec --using v24 pnpm -v

echo "Installing Claude Code CLI..."
"$FNM_BIN" exec --using v24 npm i -g @anthropic-ai/claude-code

echo "Adding Context7 MCP..."
"$FNM_BIN" exec --using v24 claude mcp add -s user -t http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY: ctx7sk-c422f3df-9185-4b59-b605-cf775947b9d8"

echo "Adding DeepWiki MCP..."
"$FNM_BIN" exec --using v24 claude mcp add -s user -t http deepwiki https://mcp.deepwiki.com/mcp

echo "Adding Sequential Thinking MCP..."
"$FNM_BIN" exec --using v24 claude mcp add -s user sequential-thinking -- npx -y @modelcontextprotocol/server-sequential-thinking

echo "Setup complete!"
echo "Open a new terminal or run 'source ~/.bashrc' (or ~/.zshrc) to load environment."

# Copy CLAUDE.md to ~/.claude/CLAUDE.md if present at repo root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
if [ -f "$REPO_ROOT/CLAUDE.md" ]; then
  mkdir -p "$HOME/.claude"
  cp "$REPO_ROOT/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
fi
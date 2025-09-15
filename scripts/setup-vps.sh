#!/bin/bash

# Install fnm (Fast Node Manager)
echo "Installing fnm..."
curl -fsSL https://fnm.vercel.app/install | bash

# Source fnm to make it available in current session
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env)"

# Install Node.js v24
echo "Installing Node.js v24..."
fnm install v24
fnm use v24

# Install pnpm
echo "Installing pnpm..."
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Source pnpm to make it available in current session
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Install Claude Code CLI
echo "Installing Claude Code CLI..."
npm i -g @anthropic-ai/claude-code

# Add MCP tools to Claude Code
echo "Adding Context7 MCP..."
claude mcp add -s user -t http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY: ctx7sk-c422f3df-9185-4b59-b605-cf775947b9d8"

echo "Adding DeepWiki MCP..."
claude mcp add -s user -t http deepwiki https://mcp.deepwiki.com/mcp

echo "Adding Sequential Thinking MCP..."
claude mcp add -s user sequential-thinking -- npx -y @modelcontextprotocol/server-sequential-thinking

echo "Setup complete!"
echo "Please restart your terminal or run 'source ~/.bashrc' (or ~/.zshrc) to use the newly installed tools."

# Move CLAUDE.md to ~/.claude/CLAUDE.md
mv CLAUDE.md ~/.claude/CLAUDE.md
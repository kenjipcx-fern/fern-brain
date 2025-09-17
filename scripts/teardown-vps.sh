#!/bin/bash

set -euo pipefail

echo "Starting teardown: removing fnm, Node (via fnm), pnpm, Claude Code, and shell profile changes..."

# Detect home and shell profile files
USER_HOME="$HOME"
PROFILE_CANDIDATES=("$USER_HOME/.bashrc" "$USER_HOME/.bash_profile" "$USER_HOME/.profile" "$USER_HOME/.zshrc")

timestamp() {
  date +%Y%m%d-%H%M%S
}

backup_file() {
  local file="$1"
  if [ -f "$file" ]; then
    cp "$file" "$file.bak.$(timestamp)"
  fi
}

clean_profile_file() {
  local file="$1"
  [ -f "$file" ] || return 0
  echo "Cleaning profile: $file"
  backup_file "$file"

  # Remove the common fnm block and pnpm env lines safely by writing a new temp file
  local tmp="$file.tmp.$(timestamp)"

  # 1) Drop the specific fnm PATH block guarded by FNM_PATH and its closing fi
  awk '
    BEGIN { skip=0 }
    /^# fnm/ { next } 
    /^if \[ -d "\$FNM_PATH" \]; then[[:space:]]*$/ { skip=1; next }
    skip == 1 && /^[[:space:]]*fi[[:space:]]*$/ { skip=0; next }
    skip == 1 { next }
    { print }
  ' "$file" > "$tmp"

  # 2) Drop single-line exports for pnpm and fnm that may have been appended
  grep -v -E '(^|[[:space:]])(PNPM_HOME=|export[[:space:]]+PNPM_HOME=|export[[:space:]]+PATH=\"\$PNPM_HOME:\$PATH\"|FNM_PATH=|eval[[:space:]]+`?\"?fnm env)' "$tmp" > "$tmp.2" || true

  mv "$tmp.2" "$file"
  rm -f "$tmp"
}

for f in "${PROFILE_CANDIDATES[@]}"; do
  clean_profile_file "$f"
done

# Remove fnm and Node versions installed via fnm
echo "Removing fnm and Node versions installed via fnm..."
rm -rf "$USER_HOME/.fnm" || true
rm -rf "$USER_HOME/.local/share/fnm" || true

# Remove pnpm (curl installer location) and store
echo "Removing pnpm installation and store..."
rm -rf "$USER_HOME/.local/share/pnpm" || true
rm -rf "$USER_HOME/.pnpm-store" || true

# Try to disable corepack if available (harmless if absent)
if command -v corepack >/dev/null 2>&1; then
  echo "Disabling corepack shims..."
  corepack disable || true
fi

# Uninstall Claude Code CLI if npm available
if command -v npm >/dev/null 2>&1; then
  echo "Uninstalling Claude Code CLI via npm..."
  npm rm -g @anthropic-ai/claude-code || true
fi

# Remove claude binary if present in PATH locations
if command -v claude >/dev/null 2>&1; then
  CLAUDE_BIN="$(command -v claude || true)"
  if [ -n "${CLAUDE_BIN:-}" ] && [ -w "$CLAUDE_BIN" ]; then
    echo "Removing claude binary at $CLAUDE_BIN"
    rm -f "$CLAUDE_BIN" || true
  fi
fi

# Remove Claude config directory (MCP servers, CLAUDE.md copy)
echo "Removing ~/.claude directory..."
if [ -d "$USER_HOME/.claude" ]; then
  # If repository copy of CLAUDE.md is missing and a copy exists in ~/.claude, attempt to restore
  if [ ! -f "CLAUDE.md" ] && [ -f "$USER_HOME/.claude/CLAUDE.md" ]; then
    echo "Restoring CLAUDE.md to current directory..."
    cp "$USER_HOME/.claude/CLAUDE.md" ./CLAUDE.md || true
  fi
  rm -rf "$USER_HOME/.claude" || true
fi

echo "Teardown complete. Open a new shell or run:"
if [ -n "${ZSH_VERSION:-}" ]; then
  echo "  source ~/.zshrc"
else
  echo "  source ~/.bashrc"
fi



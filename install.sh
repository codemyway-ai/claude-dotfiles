#!/usr/bin/env bash
set -euo pipefail

if ! command -v claude >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/claude" ]; then
  curl -fsSL https://claude.ai/install.sh | bash
fi

if ! grep -q '.local/bin' "$HOME/.bashrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi
export PATH="$HOME/.local/bin:$PATH"

mkdir -p "$HOME/.claude"
ln -sf "$HOME/dotfiles/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

echo "Dotfiles fertig: $(claude --version 2>/dev/null || echo 'CLI-Installation pruefen')"
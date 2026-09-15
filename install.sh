#!/usr/bin/env bash
set -uo pipefail

mkdir -p "$HOME/.claude"
ln -sf "$HOME/dotfiles/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
echo "CLAUDE.md verlinkt."

if ! grep -q '.local/bin' "$HOME/.bashrc" 2>/dev/null; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi
export PATH="$HOME/.local/bin:$PATH"

if ! grep -q 'ENABLE_CODE_SECURITY_REVIEW' "$HOME/.bashrc" 2>/dev/null; then
  echo 'export ENABLE_CODE_SECURITY_REVIEW=0' >> "$HOME/.bashrc"
fi

python3 - <<'EOF'
import json, os
p = os.path.expanduser("~/.claude/settings.json")
try:
    d = json.load(open(p))
except Exception:
    d = {}
d.setdefault("env", {})["ENABLE_CODE_SECURITY_REVIEW"] = "0"
json.dump(d, open(p, "w"), indent=2)
print("settings.json: env gesetzt.")
EOF

if ! command -v claude >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/claude" ]; then
  curl -fsSL https://claude.ai/install.sh | bash </dev/null || echo "CLI-Installation fehlgeschlagen - manuell nachholen."
fi

if command -v claude >/dev/null 2>&1; then
  claude plugin marketplace add obra/superpowers-marketplace </dev/null || true
  claude plugin marketplace add anthropics/claude-plugins-official </dev/null || true
  claude plugin marketplace add pbakaus/impeccable </dev/null || true
  claude plugin install superpowers@superpowers-marketplace </dev/null || true
  claude plugin install security-guidance@claude-plugins-official </dev/null || true
  claude plugin install impeccable@impeccable </dev/null || true
  claude plugin list </dev/null || true
fi

echo "Dotfiles fertig."
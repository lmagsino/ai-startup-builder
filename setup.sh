#!/usr/bin/env bash
set -euo pipefail

BUILDER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "  AI STARTUP BUILDER — Setup"
echo "  ─────────────────────────────────────────"
echo ""

detect_platform() {
  if command -v claude &>/dev/null; then
    echo "claude-code"
  elif command -v cursor &>/dev/null; then
    echo "cursor"
  elif command -v codex &>/dev/null; then
    echo "codex"
  elif command -v gemini &>/dev/null; then
    echo "gemini"
  elif command -v opencode &>/dev/null; then
    echo "opencode"
  else
    echo "unknown"
  fi
}

PLATFORM=$(detect_platform)
echo "  Detected platform: $PLATFORM"
echo ""

install_claude_code() {
  echo "  Where do you want to install ai-startup-builder?"
  echo "  [1] Global  — available in all projects (~/.claude/skills/)"
  echo "  [2] Local   — this project only (.claude/skills/)"
  echo ""
  read -rp "  Choice [1/2]: " choice

  if [[ "$choice" == "2" ]]; then
    SKILLS_DIR="$PWD/.claude/skills"
  else
    SKILLS_DIR="$HOME/.claude/skills"
  fi

  # Install core files
  local CORE="$SKILLS_DIR/ai-startup-builder"
  mkdir -p "$CORE"
  cp -r "$BUILDER_DIR"/. "$CORE/"

  # Patch INSTALL_DIR placeholder in SKILL.md
  sed -i.bak "s|\[INSTALL_DIR\]|$CORE|g" "$CORE/SKILL.md" && rm -f "$CORE/SKILL.md.bak"

  echo ""
  echo "  ✓ Installed: $CORE"
  echo ""
  echo "  Start a session:"
  echo "    /ai-startup-builder"
  echo ""
  echo "  Or use directly:"
  echo "    claude --system-prompt $CORE/ai-startup-builder.md"
  echo ""
}

uninstall_claude_code() {
  local skills_dir="${1:-$HOME/.claude/skills}"
  echo "  Removing ai-startup-builder from $skills_dir..."
  rm -rf "$skills_dir/ai-startup-builder"
  echo "  ✓ Uninstalled."
}

install_cursor() {
  local rules_dir="$PWD/.cursor/rules"
  mkdir -p "$rules_dir"
  cp "$BUILDER_DIR/ai-startup-builder.md" "$rules_dir/ai-startup-builder.md"
  echo "  ✓ Installed to: $rules_dir/ai-startup-builder.md"
  echo ""
  echo "  In Cursor, reference it with:"
  echo "    @ai-startup-builder"
  echo ""
}

install_generic() {
  local platform="$1"
  local target="$PWD/.ai-startup-builder"
  mkdir -p "$target"
  cp -r "$BUILDER_DIR"/. "$target/"
  echo "  ✓ Copied to: $target"
  echo ""
  echo "  Point your agent at: $target/ai-startup-builder.md"
  echo "  See INSTALL.md for $platform-specific instructions."
  echo ""
}

# Handle uninstall flag
if [[ "${1:-}" == "--uninstall" ]]; then
  uninstall_claude_code "${2:-$HOME/.claude/skills}"
  exit 0
fi

case "$PLATFORM" in
  claude-code)
    install_claude_code
    ;;
  cursor)
    install_cursor
    ;;
  codex|gemini|opencode|unknown)
    install_generic "$PLATFORM"
    ;;
esac

echo "  ─────────────────────────────────────────"
echo "  ai-startup-builder setup complete."
echo ""
echo "  Docs:      README.md"
echo "  Install:   INSTALL.md"
echo "  Uninstall: ./setup.sh --uninstall"
echo ""

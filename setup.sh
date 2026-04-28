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

create_skill_wrappers() {
  local skills_dir="$1"
  local core_dir="$2"

  declare -A DESCRIPTIONS=(
    ["refine"]="Sharpens a raw, vague idea into something specific enough to score. Asks one pointed question at a time — who exactly, what pain exactly, why now, why you. No scoring. Output is a refined one-liner ready for /score."
    ["score"]="Validates and scores a startup idea /100 across 7 weighted dimensions. Classifies the idea, applies a business framework (Lean Canvas, JTBD, 7 Powers, Blue Ocean), runs a Pre-Mortem, delivers a verdict. Trigger: 'roast me' for brutal mode, 'pivot' for alternatives. Produces idea-scorecard.md."
    ["plan"]="Builds the MVP roadmap. Selects a roadmap pattern, filters features ruthlessly, defines milestones, GTM strategy, and pricing. Covers MVP → V2 → Future Vision. Produces project-plan.md."
    ["mockup"]="Designs the product experience. Builds user personas, challenges the design peg, produces a design system, maps core user flows, and generates 3-5 key screens as clean HTML. Outputs consumed by ai-tech-lead /design. Token-heavy."
    ["package"]="Generates the complete developer handoff package: tech-spec.md, AI-TECH-LEAD.md (pre-filled for ai-tech-lead), linear-board.md, and pitch-deck-outline.md. Token-heavy. Final step in the build chain."
    ["investor-check"]="Assesses investor readiness across 5 dimensions: idea clarity, market proof, traction signal, team credibility, pitch quality. Score /50. Verdict: NOT READY, GETTING THERE, or READY. Top 3 gaps to close. Standalone — runs any time."
  )

  echo "  Creating skill commands:"
  for skill in refine score plan mockup package investor-check; do
    local wrapper_dir="$skills_dir/$skill"

    # Skip if a non-ai-startup-builder skill already exists here
    if [[ -d "$wrapper_dir" ]] && ! grep -q "ai-startup-builder" "$wrapper_dir/SKILL.md" 2>/dev/null; then
      echo "    ⚠  /$skill — skipped (a different skill already exists here)"
      continue
    fi

    mkdir -p "$wrapper_dir"
    cat > "$wrapper_dir/SKILL.md" <<EOF
---
name: $skill
description: >
  ${DESCRIPTIONS[$skill]}
---

You are running **ai-startup-builder** in /$skill mode.

**Load and follow the phase file exactly:**

Read: $core_dir/phases/$skill.md

The phase file defines your persona, workflow, context to load, output artifacts, and constraints.
Do not skip any step. Produce the output artifacts defined in the phase file.
EOF
    echo "    ✓ /$skill"
  done
}

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
  echo ""
  echo "  ✓ Core installed: $CORE"
  echo ""

  # Create per-skill wrappers
  create_skill_wrappers "$SKILLS_DIR" "$CORE"

  echo ""
  echo "  ✓ Done. Get started:"
  echo ""
  echo "  From idea to build:"
  echo "    /refine              — sharpen a vague idea"
  echo "    /score               — validate and score /100"
  echo "    /plan                — MVP roadmap"
  echo "    /mockup              — design system + mockups"
  echo "    /package             — developer handoff package"
  echo ""
  echo "  Any time:"
  echo "    /investor-check      — are you ready to raise?"
  echo "    (say 'roast me' in /score for brutal feedback)"
  echo "    (say 'pivot' in /score for alternative directions)"
  echo ""
}

uninstall_claude_code() {
  local skills_dir="${1:-$HOME/.claude/skills}"
  echo "  Removing ai-startup-builder skills from $skills_dir..."
  rm -rf "$skills_dir/ai-startup-builder"
  for skill in refine score plan mockup package investor-check; do
    if [[ -f "$skills_dir/$skill/SKILL.md" ]] && grep -q "ai-startup-builder" "$skills_dir/$skill/SKILL.md" 2>/dev/null; then
      rm -rf "$skills_dir/$skill"
      echo "    ✓ removed /$skill"
    fi
  done
  echo "  ✓ ai-startup-builder uninstalled."
}

install_cursor() {
  local rules_dir="$PWD/.cursor/rules"
  mkdir -p "$rules_dir"
  cp "$BUILDER_DIR/ai-startup-builder.md" "$rules_dir/ai-startup-builder.md"
  cp -r "$BUILDER_DIR/phases" "$rules_dir/ai-startup-builder-phases"
  echo "  ✓ Installed to: $rules_dir"
  echo ""
  echo "  Use in Cursor with natural language:"
  echo "    \"Sharpen my idea\"        → refine mode"
  echo "    \"Score this idea\"        → score mode"
  echo "    \"Plan the MVP\"           → plan mode"
  echo "    \"Generate mockups\"       → mockup mode"
  echo "    \"Create the handoff\"     → package mode"
  echo "    \"Am I ready to raise?\"   → investor check"
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
  echo "  Individual phase files: $target/phases/"
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

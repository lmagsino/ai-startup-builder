# ai-startup-builder — Installation

Platform-specific setup for Claude Code, Cursor, Codex, Gemini CLI, and OpenCode.

---

## Quick install (all platforms)

```bash
git clone https://github.com/lmagsino/ai-startup-builder.git
cd ai-startup-builder
./setup.sh
```

`setup.sh` detects your platform and installs automatically.

---

## Claude Code

### Install

```bash
git clone https://github.com/lmagsino/ai-startup-builder.git
cd ai-startup-builder
./setup.sh
```

Choose global (all projects) or local (current project only).

### Use

Run any skill directly:

```
/refine          — sharpen a vague idea
/score           — validate and score /100
/plan            — MVP roadmap
/mockup          — design system + HTML mockups
/package         — developer handoff package
/investor-check  — investor readiness /50
```

### How it works

The installer copies the core files to `~/.claude/skills/ai-startup-builder/` and creates
one wrapper command per skill. Each command loads its phase file and runs the full workflow
defined there. Prior artifacts (e.g. `idea-scorecard.md`) are read automatically if they
exist in the current directory.

### Uninstall

```bash
./setup.sh --uninstall
```

---

## Cursor

```bash
git clone https://github.com/lmagsino/ai-startup-builder.git
cd ai-startup-builder
./setup.sh
```

The installer copies `ai-startup-builder.md` to `.cursor/rules/`.
Reference it in Cursor with `@ai-startup-builder`.

---

## Any other AI (Codex, Gemini, OpenCode, Claude.ai Projects)

### Option A — System prompt

Paste the contents of `ai-startup-builder.md` directly into your AI's system prompt or
project instructions. No other setup needed.

### Option B — Direct file reference

```bash
git clone https://github.com/lmagsino/ai-startup-builder.git
```

Point your agent at `ai-startup-builder.md` in whatever way your tool supports.

---

## Claude.ai Projects

1. Open Claude.ai → Projects → New Project
2. Open `ai-startup-builder.md`
3. Copy the full contents
4. Paste into the Project Instructions field
5. Start a new conversation — OWNER INTAKE begins automatically

---

## Updating

```bash
cd ai-startup-builder
git pull
./setup.sh
```

Re-running `setup.sh` overwrites the previous installation.

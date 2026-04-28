# Getting Started

ai-startup-builder takes you from raw idea to a complete project package in about an hour.
No coding required. No prior startup experience required.

---

## Install

```bash
git clone https://github.com/lmagsino/ai-startup-builder.git
cd ai-startup-builder
./setup.sh
```

Then open Claude Code and run:

```
/ai-startup-builder
```

OWNER INTAKE starts automatically.

---

## Your first session

### Step 1 — Answer Owner Intake

Five questions, all in one reply:

```
1. STACK       → preferred tech stack, or "suggest"
2. DESIGN      → 3 words or a peg app (e.g. "clean, minimal, Linear")
3. RULES       → non-negotiables (e.g. mobile-first, no subscriptions)
4. AUDIENCE    → who you're building for, one sentence
5. CONSTRAINTS → timeline, budget, solo, specific market or country
```

After your reply, it outputs SESSION CONTEXT and asks for your idea.

### Step 2 — Share your idea

One sentence is fine. More context is better.

```
My idea: a tool that automatically categorizes freelancer expenses
         from bank statement PDFs and generates quarterly tax summaries
```

### Step 3 — Go through the phases

| Phase | Time | What to do |
|-------|------|-----------|
| Phase 1 — Challenge | ~15 min | Read the scorecard. Approve, pivot, or kill at Gate 1. |
| Phase 2 — Plan | ~10 min | Review the roadmap and MVP scope. Approve at Gate 2. |
| Phase 3 — Design | ~20 min | Review personas, flows, and mockups. Approve at Gate 3. |
| Phase 4 — Build Package | ~15 min | Receive all handoff files. Session complete. |

### Step 4 — Save the outputs

All files go in `projects/[your-project-name]/`. Copy them to your project repo.

---

## Reading the scorecard

The scorecard scores your idea /100 across 7 dimensions. Understand the verdict:

- **🔴 KILL IT (0–40)** — Structural problems. Execution won't fix them. Stop or pivot.
- **🟡 PIVOT IT (41–60)** — Core insight is good, the angle is wrong. Pivot suggestions are provided.
- **🟢 BUILD IT (61–80)** — Solid. Execute well and you have a real shot.
- **⭐ BET ON IT (81–100)** — Strong signal. Move fast.

A KILL or PIVOT does not end the session — it starts a pivot conversation.

---

## Handing off to ai-tech-lead

At the end of Phase 4, you have `AI-TECH-LEAD.md` pre-filled and ready. Drop it into your project repo:

```bash
git init [project-name]
cp AI-TECH-LEAD.md [project-name]/
cp tech-spec.md [project-name]/
cp -r design/ [project-name]/
cd [project-name]
claude   # with ai-tech-lead loaded
/strategy
```

She reads the files and outputs `STRATEGY.md` — GO or STOP.

---

## Next

- [Workflows](workflows.md) — full session walkthroughs
- [Customization](customization.md) — tune for your context

# Getting Started

ai-startup-builder gives you 6 standalone skills. Run them in order for the full flow, or jump to any skill directly — each one reads prior artifacts and asks inline for what's missing.

---

## Install

```bash
git clone https://github.com/lmagsino/ai-startup-builder.git
cd ai-startup-builder
./setup.sh
```

Then run any skill:

```
/refine
/score
/plan
/mockup
/package
/investor-check
```

---

## The skills

| Skill | When to use |
|-------|------------|
| `/refine` | "I have a rough idea" or "I don't know what to build yet" — pulls market data + sharpens against evidence |
| `/score` | "Is this worth building?" |
| `/plan` | "What should I build first?" |
| `/mockup` | "What should it look like?" |
| `/package` | "Give me everything the developer needs" |
| `/investor-check` | "Am I ready to raise?" |

---

## Your first run (standard flow)

### 1. Refine

```
/refine
```

Answers: "What's your idea? Even rough is fine — I'll do the research."

Diagnoses your founder archetype (insider pain, category-only, tool-first, pattern clone, lost, or pre-baked) and runs the right intervention. For most archetypes, it pulls real research first — competitors with prices, market sizing, user complaints from forums, why-now signals, named communities for your first 100 users — then asks only the questions that need *your* judgment. Catches anti-patterns by name. Saves `refined-idea.md` with cited sources and a flagged killer assumption.

Requires web search. Falls back to pure Q&A if unavailable.

### 2. Score

```
/score
```

If `idea-scorecard.md` doesn't exist, it asks for the idea.
If it does, it loads it and you can re-score or continue.

Runs a business framework, scores 7 dimensions /100, delivers a verdict. If score < 61, pivot suggestions are auto-generated.

**Modes:**
- Say `roast me` → brutal no-filter feedback + top 3 fixes
- Say `pivot` → 3 alternative directions, each rough-scored

### 3. Plan

```
/plan
```

Reads `idea-scorecard.md`. Challenges the feature scope, selects a roadmap pattern, defines milestones, GTM, and pricing. Saves `project-plan.md`.

### 4. Mockup

```
/mockup
```

Reads `project-plan.md`. Asks for design taste if not in context. Produces user personas, design system, user flows, and 3-5 HTML mockups. Token-heavy — flags before generating.

### 5. Package

```
/package
```

Reads all prior files. Produces:
- `tech-spec.md`
- `AI-TECH-LEAD.md` ← drop into project repo
- `linear-board.md`
- `pitch-deck-outline.md`

Token-heavy — flags before generating.

---

## Skipping to a phase

You don't have to run all skills in order. Each one asks inline for what it needs.

```
/score
# No idea-scorecard.md found
# → "What's your idea?"
# → [you give the idea]
# → [scores it directly]
```

```
/plan
# No idea-scorecard.md found
# → "What's the idea and score from /score?
#    (or tell me the idea and I'll plan without a score)"
```

---

## Reading the scorecard

- 🔴 **KILL IT (0–40)** — Structural problems. Stop or pivot.
- 🟡 **PIVOT IT (41–60)** — Core insight good, angle is wrong. Pivots auto-generated.
- 🟢 **BUILD IT (61–80)** — Solid. Execute well.
- ⭐ **BET ON IT (81–100)** — Strong signal. Move fast.

---

## Handing off to ai-tech-lead

After `/package`:

```bash
git init [project-name]
cp AI-TECH-LEAD.md tech-spec.md [project-name]/
cp -r mockups/ design-system.md user-flows.md user-personas.md [project-name]/
cd [project-name]
claude   # with ai-tech-lead loaded
/strategy
```

---

## Next

- [Workflows](workflows.md) — common session patterns
- [Customization](customization.md) — tune scoring, frameworks, and defaults

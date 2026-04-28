# Workflows

Common session patterns for different founder situations.

---

## New idea, starting from scratch

The standard flow. Takes ~1 hour.

```
/ai-startup-builder
→ Answer Owner Intake (5 questions)
→ Share your idea
→ Phase 1 — Challenge (score + scorecard)
  → Gate 1: Approve / Pivot / Kill
→ Phase 2 — Plan (roadmap + MVP scope)
  → Gate 2: Approve / Adjust
→ Phase 3 — Design (personas + flows + mockups)
  → Gate 3: Approve / Adjust / Redo
→ Phase 4 — Build Package (all handoff files)
→ Done — copy files to project repo
```

---

## Idea that needs brutal feedback

Use ROAST MODE before going through the phases.

```
/ai-startup-builder
→ Answer Owner Intake
→ Share your idea, then say "roast me"
→ Get no-filter feedback + top 3 fixes
→ Decide whether to proceed or rethink
→ Say "proceed" to continue to Phase 1
```

---

## Idea that keeps failing the scorecard

Use PIVOT MODE to find the right angle.

```
/ai-startup-builder
→ Phase 1 scores < 61
→ Automatic pivot suggestions generated
→ Or say "pivot" at any time
→ Pick a direction, or ask to score each pivot
→ Re-challenge the strongest pivot
→ Continue from Phase 1 with new angle
```

---

## Already have a plan, need the handoff package

Skip to Phase 4 by telling it at Owner Intake.

```
/ai-startup-builder
→ Answer Owner Intake
→ Share your idea + say "I have a plan already, skip to Phase 4"
→ Provide your existing plan details
→ Phase 4 generates: tech-spec.md + AI-TECH-LEAD.md + linear-board.md
```

---

## Checking investor readiness

```
/ai-startup-builder
→ Complete the session (or load a previous scorecard)
→ Say "investor check"
→ Get readiness score /50 across 5 dimensions
→ Top 3 gaps to close before raising
```

---

## Full founder OS flow (with ai-tech-lead)

```
ai-startup-builder session (~1 hour)
  → idea-scorecard.md
  → project-plan.md
  → design-system.md + user-flows.md + mockups/
  → tech-spec.md
  → AI-TECH-LEAD.md

git init [project-name]
cp AI-TECH-LEAD.md tech-spec.md [project-name]/
cp -r design/ [project-name]/
cd [project-name]

ai-tech-lead session
  /strategy   → STRATEGY.md (GO or STOP)
  /design     → DESIGN.md
  /roadmap    → ROADMAP.md + dev brief
  /blueprint  → specs/[feature].md
  /forge      → committed code
  /guard      → code review scorecard
  /launch     → GO or NO-GO
```

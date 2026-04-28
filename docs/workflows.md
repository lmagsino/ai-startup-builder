# Workflows

Common session patterns.

---

## Full flow — idea to handoff (~1 hour)

```
/refine          → sharpen vague idea
/score           → validate + score /100
/plan            → MVP roadmap
/mockup          → design + HTML screens
/package         → dev handoff package
```

Each step saves a file. Each next step reads it automatically.

---

## Already have a clear idea, skip refinement

```
/score
→ "What's your idea?" [you give it directly]
→ [scores + scorecard]
/plan
/mockup
/package
```

---

## Idea needs brutal feedback first

```
/score
→ Share idea
→ Say "roast me"
→ [ROAST MODE: no-filter + top 3 fixes]
→ Decide whether to proceed or rethink
→ Gate 1: Proceed / Pivot / Kill
```

---

## Low score — explore pivots

```
/score
→ Score < 61 → auto-generates PIVOT SUGGESTIONS
→ Or say "pivot" any time during /score
→ Pick a direction
→ /score [with new angle]
→ Continue if score > 61
```

---

## Just need the design

```
/mockup
→ Asks: "What are the 3-5 MVP features and primary user?"
→ Asks: "3 words or peg app for design direction?"
→ [design system + flows + HTML mockups]
```

---

## Just need the tech spec

```
/package
→ Loads prior files if present
→ Asks for missing context inline
→ [tech-spec.md + AI-TECH-LEAD.md + linear-board + pitch deck]
```

---

## Check investor readiness (any stage)

```
/investor-check
→ [with no artifacts: asks "where are you?"]
→ [with artifacts: loads and assesses]
→ Score /50 + top 3 gaps
```

---

## Full founder OS — ai-startup-builder → ai-tech-lead

```
# BUSINESS BRAIN (ai-startup-builder)
/refine   →  refined idea
/score    →  idea-scorecard.md
/plan     →  project-plan.md
/mockup   →  design-system.md + user-flows.md + mockups/
/package  →  tech-spec.md + AI-TECH-LEAD.md + linear-board.md

# HANDOFF
git init [project-name]
cp AI-TECH-LEAD.md tech-spec.md [project-name]/
cp -r mockups/ design-system.md user-flows.md user-personas.md [project-name]/
cd [project-name]

# TECHNICAL BRAIN (ai-tech-lead)
/strategy   →  STRATEGY.md (GO or STOP)
/design     →  DESIGN.md
/roadmap    →  ROADMAP.md + dev brief
/blueprint  →  specs/[feature].md
/forge      →  committed code
/guard      →  code review scorecard
/launch     →  GO or NO-GO
```

# ai-startup-builder

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Built for Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-blueviolet)](https://claude.ai/code)
[![Phases](https://img.shields.io/badge/Phases-4-green)]()

**The business brain before the technical brain.**

Takes you from raw idea to a validated, designed, and fully specced project package in ~1 hour.
Hands off directly to [ai-tech-lead](https://github.com/lmagsino/ai-tech-lead). No meetings. No gaps.

> **Why not just use Claude?** ai-startup-builder is a structured workflow with gates, hard stops,
> and scoring frameworks — not a general-purpose chatbot. It challenges your idea before generating
> anything, enforces phase gates, and produces files your technical co-founder can act on immediately.

```
You: my idea is a task manager for freelancers

ai-startup-builder: Before we score this — who specifically?
                    "Freelancers" is 70M people. Designers? Devs? Writers?
                    And what does every other task manager get wrong for them?
```

---

## Quick start

```bash
git clone https://github.com/lmagsino/ai-startup-builder.git
cd ai-startup-builder
./setup.sh
```

Then:

```
/ai-startup-builder
```

No idea needed yet. OWNER INTAKE starts automatically.

Works with **Claude Code**, **Cursor**, **Codex**, **Gemini CLI**, **OpenCode**, and **Claude.ai Projects**.
See [INSTALL.md](INSTALL.md) for details.

---

## What you get

One session (~1 hour) produces a complete project folder:

```
projects/[name]/
├── idea-scorecard.md       → validation result with score /100
├── project-plan.md         → MVP → V2 → Future roadmap
├── linear-board.md         → paste-ready for Linear
├── design-system.md        → brand, colors, typography
├── user-personas.md        → who you're building for
├── user-flows.md           → core user journeys
├── mockups/                → key screens as HTML
├── tech-spec.md            → for ai-tech-lead /blueprint
└── AI-TECH-LEAD.md         → pre-filled, drop into project repo
```

---

## Phases

| Phase | What happens | Time | Output |
|-------|-------------|------|--------|
| **OWNER INTAKE** | 5 questions: stack, design taste, rules, audience, constraints | 2 min | SESSION CONTEXT |
| **Phase 1 — Challenge** | Classify → framework → score /100 → verdict | ~15 min | `idea-scorecard.md` |
| **Phase 2 — Plan** | Roadmap pattern → MVP filter → milestones → GTM | ~10 min | `project-plan.md` |
| **Phase 3 — Design** | Personas → flows → design system → HTML mockups | ~20 min | `design-system.md`, `user-flows.md`, `mockups/` |
| **Phase 4 — Build Package** | tech-spec → AI-TECH-LEAD.md → Linear board → pitch deck | ~15 min | All handoff files |

Each phase ends with a gate. No gate approval = no next phase.

---

## Scoring

Every idea is scored /100 across 7 weighted dimensions:

| Dimension | Weight |
|-----------|--------|
| Monetization Clarity | 20% |
| Market Size | 15% |
| Competition Density | 15% |
| Founder-Market Fit | 15% |
| Time to First Revenue | 15% |
| Technical Feasibility | 10% |
| Unfair Advantage | 10% |

**Verdicts:**
- 🔴 KILL IT (0–40) — Structural problems execution won't fix
- 🟡 PIVOT IT (41–60) — Core insight good, angle is wrong
- 🟢 BUILD IT (61–80) — Solid idea, execute well
- ⭐ BET ON IT (81–100) — Strong signal, move fast

---

## Special modes

| Trigger | Mode | What it does |
|---------|------|-------------|
| `roast me` | ROAST MODE | No-filter brutal feedback + top 3 fixes |
| `pivot` | PIVOT MODE | 3 alternative directions, each scored |
| `investor check` | INVESTOR READINESS | Readiness score /50 + top 3 gaps |

---

## Handoff to ai-tech-lead

After Phase 4, you get a ready-to-use `AI-TECH-LEAD.md` pre-filled with everything she needs:

```bash
git init [project-name]
cp AI-TECH-LEAD.md [project-name]/
cp tech-spec.md [project-name]/
cp -r design/ [project-name]/
cd [project-name]
claude   # with ai-tech-lead loaded
/strategy
```

She reads `AI-TECH-LEAD.md` + `tech-spec.md` and outputs `STRATEGY.md` — GO or STOP.

---

## Companion repo

**[ai-tech-lead](https://github.com/lmagsino/ai-tech-lead)** — your technical co-founder.

```
ai-startup-builder  →  THINK before you build
                        Business brain. Founder language.
                        ~1 hour per project.

ai-tech-lead        →  BUILD after you think
                        Technical brain. Developer language.
                        Days to weeks per project.

Together            →  Your complete founder OS.
                        Idea to shipped product.
                        No meetings. No gaps.
```

---

## Contributing

You can contribute:
- New frameworks → `knowledge/challenge/frameworks/`
- New playbooks → `knowledge/challenge/playbooks/`
- New roadmap patterns → `knowledge/market/roadmap-patterns/`
- Real scorecards → `knowledge/community/submitted-scorecards.md`
- Pivot and success stories → `knowledge/community/`

Every contribution must include:
```
> WHEN TO USE: [specific trigger]
> TOKEN COST: low | medium | high
> APPLIES TO: saas | marketplace | consumer | b2b | ai-product | all
> SOURCE: [origin or author if applicable]
```

---

## License

MIT — open source forever.

---

*Built for solo founders, indie hackers, and anyone crazy enough to build something from nothing.*

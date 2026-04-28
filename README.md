# ai-startup-builder

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Built for Claude Code](https://img.shields.io/badge/Built%20for-Claude%20Code-blueviolet)](https://claude.ai/code)
[![Skills](https://img.shields.io/badge/Skills-6-orange)]()

**The business brain before the technical brain.**

Solo founders get a co-founder who challenges ideas before they get built, then produces a complete project package ready to hand to a developer. Built on [Claude Code](https://claude.ai/code).

> **Why not just use Claude?** ai-startup-builder is a structured workflow with scoring frameworks, hard phase gates, and artifact chains — not a general-purpose chatbot. It challenges your idea before generating anything, scores it before planning, and blocks the next phase until the current one is approved.

```
ai-startup-builder: What's your idea? Even rough is fine — I'll do the research.

You: AI tool for restaurant reservations

ai-startup-builder: Pulling what's already out there. One sec.
                    [searches: OpenTable pricing, Resy market share,
                     restaurant tech reddit, Yelp reservation API…]

                    OpenTable owns 60k+ restaurants. Resy was acquired by Amex.
                    The real complaint on r/restaurantowners is no-show fees and
                    walk-in juggling — not booking itself. Three angles emerge —
                    no-show prevention, dynamic walk-in routing, or post-meal
                    review automation. Which feels closest?
```

<p align="center">
  <img src="assets/workflow.svg" alt="ai-startup-builder — Workflow Overview" width="100%">
</p>

---

## Quick start

```bash
git clone https://github.com/lmagsino/ai-startup-builder.git
cd ai-startup-builder
./setup.sh
```

Then run any skill directly:

```
/refine
/score
/plan
/mockup
/package
/investor-check
```

Works with **Claude Code**, **Cursor**, **Codex**, **Gemini CLI**, and **OpenCode**. See [INSTALL.md](INSTALL.md) for details.

---

## Skills

Each skill is a standalone command. Run them in order or jump to any phase — each one reads prior artifacts from the current directory if they exist, and asks inline for what's missing.

| Skill | What it does | Produces |
|-------|-------------|---------|
| `/refine` | Research-enabled discovery — pulls market data, competitors, real user complaints, then sharpens against evidence | `refined-idea.md` (with citations) |
| `/score` | Validate + score /100 across 7 dimensions — verdict + risks | `idea-scorecard.md` |
| `/plan` | MVP roadmap — pattern, scope, milestones, GTM, pricing | `project-plan.md` |
| `/mockup` | Personas + design system + flows + HTML mockups | `design-system.md`, `user-flows.md`, `mockups/` |
| `/package` | Full developer handoff — tech spec, AI-TECH-LEAD.md, Linear board, pitch deck | All handoff files |
| `/investor-check` | Investor readiness /50 — top 3 gaps to close before raising | Assessment |

**Modes inside `/score`:**
- Say `roast me` → no-filter brutal feedback + top 3 fixes
- Say `pivot` (or score < 61) → 3 alternative directions, each scored

---

## Standard flow

```
/refine     → sharpen the idea
/score      → validate and score
/plan       → MVP roadmap
/mockup     → design and screens
/package    → handoff to ai-tech-lead
```

Each step saves a file. Each next step reads it.

---

## Scoring

Every idea scored /100 across 7 weighted dimensions:

| Dimension | Weight | What earns a high score |
|-----------|--------|------------------------|
| Monetization Clarity | 20% | Clear model with comparable benchmarks |
| Market Size | 15% | Large and growing (>$1B TAM) |
| Competition Density | 15% | Underserved, clear white space |
| Founder-Market Fit | 15% | Deep expertise, lived the problem |
| Time to First Revenue | 15% | <6 months with right execution |
| Technical Feasibility | 10% | Buildable with current tools in <6 months |
| Unfair Advantage | 10% | Strong moat (data, network, IP, brand, access) |

**Verdicts:**
- 🔴 KILL IT (0–40) — Structural problems. Execution won't fix them.
- 🟡 PIVOT IT (41–60) — Core insight good, angle is wrong. Pivots auto-generated.
- 🟢 BUILD IT (61–80) — Solid. Execute well.
- ⭐ BET ON IT (81–100) — Strong signal. Move fast.

---

## How it works

**Research before refine.** `/refine` pulls market data, competitor pricing, real user complaints, and why-now signals via web search before asking the founder anything. The questions left for the founder are the ones that actually need their judgment — not facts they couldn't know.

**Challenges first.** Every skill opens with a challenge — never with enthusiasm.

**Artifacts chain.** `/refine` saves `refined-idea.md` → `/score` reads it and saves `idea-scorecard.md` → `/plan` reads that → `/mockup` reads plan → `/package` reads everything. Each step builds on the last.

**Independent entry.** Jump to any skill at any time. If prior files don't exist, the skill asks inline for the minimum needed. No ceremony.

**Hard gates.** Each phase skill ends with a gate question. The next skill is named explicitly — proceed only when ready.

**Hands off cleanly.** `/package` produces `AI-TECH-LEAD.md` pre-filled for [ai-tech-lead](https://github.com/lmagsino/ai-tech-lead). Drop it in the project repo and run `/strategy`.

---

## Handoff to ai-tech-lead

```bash
git init [project-name]
cp AI-TECH-LEAD.md tech-spec.md [project-name]/
cp -r mockups/ design-system.md user-flows.md user-personas.md [project-name]/
cd [project-name]
claude   # with ai-tech-lead loaded
/strategy
```

She reads `AI-TECH-LEAD.md` + `tech-spec.md`. Outputs `STRATEGY.md` — GO or STOP.

---

## Companion repo

**[ai-tech-lead](https://github.com/lmagsino/ai-tech-lead)** — the technical co-founder who picks up where ai-startup-builder ends.

```
ai-startup-builder  →  Think before you build
                        Business brain. Founder language. ~1 hour.

ai-tech-lead        →  Build after you think
                        Technical brain. Developer language. Days to weeks.

Together            →  Your complete founder OS.
                        Idea to shipped product. No meetings. No gaps.
```

---

## Docs

- [Getting started](docs/getting-started.md) — first session walkthrough
- [Workflows](docs/workflows.md) — common session patterns
- [Customization](docs/customization.md) — tune scoring, frameworks, and stack defaults

---

## Contributing

Issues and PRs welcome — new frameworks, playbooks, roadmap patterns, real scorecards.

Every contribution must include:

```
> WHEN TO USE: [specific trigger]
> TOKEN COST: low | medium | high
> APPLIES TO: saas | marketplace | consumer | b2b | ai-product | all
> SOURCE: [origin or author if applicable]
```

## License

MIT — open source forever.

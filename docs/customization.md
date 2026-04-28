# Customization

How to tune ai-startup-builder for your specific context.

---

## Adjusting the scoring weights

The scoring weights live in `phases/score.md`. Edit the SCORE section to shift emphasis.

```
Market Size (15%)
Competition Density (15%)
Founder-Market Fit (15%)
Technical Feasibility (10%)
Monetization Clarity (20%)
Time to First Revenue (15%)
Unfair Advantage (10%)
```

**Example: B2B SaaS context** — raise Monetization Clarity and Time to First Revenue, lower Consumer signals.

**Example: Marketplace context** — raise Network Effects (add as a dimension) and lower Technical Feasibility.

---

## Adding a custom framework

Add to the `### Apply Framework` step in `phases/score.md`:

```markdown
**Your Framework Name** ← when to use it
\`\`\`
Component 1 → [what to analyze]
Component 2 → [what to analyze]
Component 3 → [what to analyze]
\`\`\`
```

Include the contribution header:
```
> WHEN TO USE: [specific trigger]
> TOKEN COST: low | medium | high
> APPLIES TO: saas | marketplace | consumer | b2b | ai-product | all
> SOURCE: [your name or origin]
```

---

## Scoping to a specific market

For market-specific versions (e.g. Philippines, Southeast Asia, solo indie hackers), add a preamble to the relevant phase files. Example for `phases/score.md`:

```markdown
## MARKET CONTEXT

This version is scoped to the Philippine market.
- Currency references: Philippine Peso (₱)
- Market size benchmarks: PH population 115M, internet penetration ~73%
- Key incumbents to check: GCash, Maya, Grab, Shopee
- Regulatory notes: BSP for fintech, FDA for health
```

---

## Changing the default stack suggestions

Edit the `### Stack Decisions` section in `ai-startup-builder.md` to reflect your preferred defaults. This affects stack recommendations produced by `/package`.

---

## Skipping skills

Each skill is standalone — just run the one you need. If prior files don't exist, the skill asks inline for what it needs.

```
/score
# No idea-scorecard.md found
# → "What's your idea?"
# → [scores it directly]
```

```
/plan
# No idea-scorecard.md found
# → "What's the idea and score from /score?
#    (or tell me the idea and I'll plan without a score)"
```

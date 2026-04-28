# Customization

How to tune ai-startup-builder for your specific context.

---

## Adjusting the scoring weights

The default weights reflect a general-purpose startup. Edit `ai-startup-builder.md` to shift emphasis.

```markdown
| Dimension             | Weight | Score | Weighted |
|---|---|---|---|
| Market Size           | 15%    | /10   |          |
| Competition Density   | 15%    | /10   |          |
| Founder-Market Fit    | 15%    | /10   |          |
| Technical Feasibility | 10%    | /10   |          |
| Monetization Clarity  | 20%    | /10   |          |
| Time to First Revenue | 15%    | /10   |          |
| Unfair Advantage      | 10%    | /10   |          |
```

**Example: B2B SaaS context** — raise Monetization Clarity and Time to First Revenue, lower Consumer signals.

**Example: Marketplace context** — raise Network Effects (add as a dimension) and lower Technical Feasibility.

---

## Adding a custom framework

Add to the `## PHASE 1 — CHALLENGE` section under `### Step 2 — Apply Framework`:

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

For market-specific versions (e.g. Philippines, Southeast Asia, solo indie hackers), add a preamble to `ai-startup-builder.md`:

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

Edit the `### Stack Decisions` section in the Knowledge Base to reflect your preferred defaults.

---

## Skipping phases

ai-startup-builder enforces phase gates by default. To skip to a specific phase, tell it at the start:

```
"I already have a validated idea. Skip Phase 1 and start at Phase 2."
```

It will ask for the minimum context it needs (idea type, one-liner, top risks) before proceeding.

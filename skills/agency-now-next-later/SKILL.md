---
name: agency-now-next-later
description: Phase 5 of the Sprint Framework — translates a working pilot into a phased roadmap (Now / Next / Later) for the client. The artifact that closes proposals, structures retainers, and surfaces the upsell path. Mirrors the Blue Label / AAA 2.0 methodology. Use when the user says "now next later", "roadmap", "phase 5", "phased plan", "what's next after the pilot".
---

# Now-Next-Later Roadmap (Sprint Framework — Phase 5)

The artifact you deliver to the client at the end of the pilot — a phased plan showing what's done **now**, what should come **next** (the retainer), and what's worth tackling **later**. This is the document that converts a pilot into ongoing work.

## Inputs

Read:
- `memory/clients/{client-slug}/strategic-alignment.md` — the original metric, what's still gap
- `memory/clients/{client-slug}/process-map.md` — the steps not yet AI-ified
- `memory/clients/{client-slug}/use-case-matrix.md` — the candidates that *weren't* picked as pilot
- `memory/clients/{client-slug}/sprint-plan.md` — what the pilot actually delivered
- `memory/value-drivers.md` — to align upsells to the agency's drivers

## The three buckets

| Bucket | Definition | Time horizon | Client mood |
|---|---|---|---|
| **NOW** | Live in production from the pilot | Today | "We have this." |
| **NEXT** | Highest-impact extensions, contracted as Phase 2 / retainer | Next 30-90 days | "Let's commit." |
| **LATER** | Roadmap items that need NEXT to land first, or wait on data/budget | 90+ days | "I see where this goes." |

## Method

### NOW (what's already live)
Pull from `sprint-plan.md` Definition of Done. State exactly what's working, exactly which metric moved, and the proof (numbers, demo URL, anything tangible).

### NEXT (what to commit to in the next 90 days)
Pull from `use-case-matrix.md` — top 3 candidates that weren't selected as pilot, **plus** any handoffs/integrations that the pilot needs to fully land.

For each NEXT item:
- What it does
- Which **Value Driver** it serves (from the agency's positioning)
- Estimated sprint length
- Estimated price point
- Dependency on NOW

### LATER (the strategic horizon)
Items that:
- Need NEXT to land first
- Require client capability we haven't built yet
- Are high-impact but the timing isn't right

For each LATER item: brief description + the unlock condition.

## Output

Write to `memory/clients/{client-slug}/now-next-later.md`:

```markdown
# Now-Next-Later — {Client Name}

**Date:** YYYY-MM-DD
**Original metric (from strategic-alignment.md):** ...
**Movement during pilot:** ... → ... (Δ ...)

---

## NOW — What's live

**{Pilot name}** — production-ready

- Solves: {primary problem}
- Owner: {client-side user}
- Result: {metric movement, in numbers}
- Demo: {link / Loom}

---

## NEXT — Committed plan (next 30-90 days)

| # | Initiative | Value Driver | Sprint length | Price | Dependency |
|---|---|---|---|---|---|
| 1 | ... | ... | 2 weeks | $... | NOW |
| 2 | ... | ... | 2 weeks | $... | #1 |
| 3 | ... | ... | 1 week | $... | NOW |

**Recommended structure:** {Phase 2 fixed-scope / monthly retainer / hybrid}
**Total NEXT investment:** $...

---

## LATER — Strategic horizon

| Initiative | Value Driver | Unlock condition |
|---|---|---|
| ... | ... | After NEXT #2 |
| ... | ... | When client has ... |

---

## What this means for the metric

- NOW delivered: Δ ...%
- NEXT projected: Δ ...% (cumulative)
- LATER projected: Δ ...% (cumulative)

**Total opportunity:** ... → ... over 12 months.
```

## After writing

> Now-Next-Later is delivered. The client can see the pilot worked, what's next, and where it leads.
>
> If they want to commit to NEXT, run `/agency-retainer-architect` to convert the NEXT bucket into a retainer / Phase 2 contract.
>
> Want a Gamma-ready slide version of this for the client wrap presentation? Say so and I'll render it.

## Boundaries

- Don't oversell LATER — vague future possibilities erode trust.
- Always anchor to the metric from `strategic-alignment.md`. If you can't connect a NEXT item to that metric, drop it.
- Never include items the client hasn't seen evidence of demand for. This is a credibility document.

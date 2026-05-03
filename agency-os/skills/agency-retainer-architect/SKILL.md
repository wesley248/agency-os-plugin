---
name: agency-retainer-architect
description: Phase 6 of the Sprint Framework — converts a successful pilot + Now-Next-Later roadmap into a structured monthly retainer. Designs scope, deliverables, comms cadence, success metrics, and pricing. Mirrors the Blue Label / AAA 2.0 transfer phase. Use when the user says "retainer", "phase 6", "ongoing engagement", "post-pilot", "convert to monthly", or "transfer phase".
---

# Retainer Architect (Sprint Framework — Phase 6)

The pilot worked. Now-Next-Later is delivered. The client wants to commit to ongoing work. This skill turns that intent into a structured retainer the implementer can deliver consistently.

## Inputs

Read:
- `memory/clients/{client-slug}/strategic-alignment.md` — the metric, the Champion
- `memory/clients/{client-slug}/now-next-later.md` — the NEXT initiatives
- `memory/value-drivers.md` — agency's pricing posture
- `memory/offer-stack.md` — agency's standard premium / retainer tier

If `now-next-later.md` is missing, route to `/agency-now-next-later`.

## The four retainer shapes

Most agency retainers fall into one of these. Pick the one that matches the NEXT initiatives:

| Shape | What it is | Best for | Pricing model |
|---|---|---|---|
| **Hours pool** | X hours / month, flexible work | Maintenance + ad hoc enhancements | Per-hour cap |
| **Sprint subscription** | Fixed N sprints/quarter | Multiple Phase 2 initiatives queued | Per-sprint flat |
| **Outcome-based** | Paid against metric movement | Mature client, clear KPI | Base + bonus |
| **Embedded fractional** | Implementer = fractional CMO/COO/CTO | Strategic role + delivery | Monthly retainer |

## Method

Run through six decisions with the implementer:

### 1. Shape
Which of the four matches what the client needs? Why?

### 2. Scope boundaries
What's IN the retainer? What's OUT? **Especially out** — scope creep kills retainers. Pull exclusions explicitly from `offer-stack.md`.

### 3. Cadence
- **Weekly check-ins?** day, time, length
- **Monthly steering meeting?** with whom
- **Quarterly business review?** content + format
- **Async channel?** Slack / email / Loom

### 4. Success metrics
What does "good month" look like? Tie to the metric in `strategic-alignment.md` plus 1-2 retainer-specific metrics (response time, sprints completed, etc.).

### 5. Pricing
- **Headline:** $X/month
- **Term:** minimum N months
- **Payment:** upfront annual? monthly? quarterly?
- **Increase clause:** annual escalation %?

### 6. Off-ramp
- **Pause / cancel terms:** notice period
- **What the client owns** at end (code, models, agents, docs)
- **Knowledge transfer commitment** if the engagement ends

## Output

Write to `memory/clients/{client-slug}/retainer.md`:

```markdown
# Retainer — {Client Name}

**Effective:** YYYY-MM-DD
**Term:** {N months minimum}
**Champion:** ...
**Implementer:** ...

## Shape
**{Hours pool / Sprint subscription / Outcome-based / Embedded fractional}**

Why this shape: ...

## Scope IN
- ...
- ...
- ...

## Scope OUT (explicit)
- ❌ ... → upsell or refer-out
- ❌ ...

## Cadence
| Touchpoint | Frequency | Length | Who attends |
|---|---|---|---|
| Weekly | {day, time} | 30 min | Champion + Implementer |
| Monthly steering | First week of month | 60 min | Champion + Sponsor |
| Quarterly review | End of quarter | 90 min | Full stakeholder group |
| Async | Slack #channel | Continuous | Champion + Implementer |

## Success metrics
1. **{Anchor metric from strategic-alignment.md}** — track monthly
2. **Sprints completed:** N/quarter
3. **Response SLA:** ... hours

## Pricing
- **Monthly:** $...
- **Term:** {N} months
- **Payment:** {monthly upfront / quarterly / annual}
- **Annual increase:** ... %

## Off-ramp
- **Notice period:** {N} days
- **Client owns at exit:** ...
- **Knowledge transfer:** ...
```

## After writing

> Retainer is architected. Send to the Champion for approval. Once signed, the engagement transitions from "Sprint Framework" to "ongoing rhythm" — the Head of Delivery persona takes over day-to-day, with quarterly Now-Next-Later refreshes.
>
> Want me to draft the contract redlines via `/agency-sprint-proposal` (retainer mode)?

## Boundaries

- Never propose a retainer where scope is "anything you need" — that's a hostage situation.
- Always include an off-ramp. Clients commit harder when they can leave.
- Outcome-based pricing should never be your first retainer with a client — only after 6+ months when you understand their data.

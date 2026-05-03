---
name: agency-use-case-matrix
description: Phase 2.5 of the Sprint Framework — surfaces and scores every AI automation candidate from a process map, then selects the best pilot. Mirrors the Blue Label / AAA 2.0 use-case matrix methodology. Use when the user says "use case matrix", "AI opportunities", "score automations", "pilot selection", "phase 2.5", or after process mapping.
---

# Use Case Matrix (Sprint Framework — Phase 2.5)

The bridge between a mapped process and a sprint plan. Looks at every step in the process map, surfaces every AI / automation opportunity, scores them, and picks the pilot.

## Inputs

Read:
- `memory/clients/{client-slug}/strategic-alignment.md` — the metric we're moving
- `memory/clients/{client-slug}/process-map.md` — the steps, handoffs, manual repetition

If `process-map.md` is missing, stop and direct user to `/agency-process-map`.

## Surface candidates

For each row in the process map, ask three questions:

1. **Is there manual repetition or judgment that an LLM/agent could perform?** (yes/no)
2. **Is the input data structured enough for AI to act on?** (yes/partly/no)
3. **What's the failure mode if AI gets it wrong?** (low/medium/high)

Anything answered "yes" to Q1 becomes a candidate. List them all — don't filter yet.

## Score each candidate (4 dimensions)

| Dimension | What it measures | Score 1-5 |
|---|---|---|
| **Impact on the metric** | How much does this move the Q2 metric? | 1=barely / 5=most of the gap |
| **Implementation effort** | Build complexity, integration depth | 1=hard / 5=easy |
| **Time to value** | How fast can we prove it works? | 1=slow / 5=fast |
| **Risk of failure** | What's the blast radius if it breaks? | 1=high / 5=low |

**Pilot score = sum of the four (max 20).**

## The matrix

```
                      LOW EFFORT                          HIGH EFFORT
                      
HIGH IMPACT     ┌─────────────────────────┐ ┌─────────────────────────┐
                │  PILOT CANDIDATES       │ │  ROADMAP (Now-Next-Later)│
                │  → Sprint plan          │ │  → Phase 2 retainer     │
                └─────────────────────────┘ └─────────────────────────┘
                
LOW IMPACT      ┌─────────────────────────┐ ┌─────────────────────────┐
                │  QUICK WINS / DEPRIORITIZE│ │  IGNORE                 │
                │  → Backlog              │ │  → Refer-out / kill     │
                └─────────────────────────┘ └─────────────────────────┘
```

## Pilot selection

The pilot is **the highest-scoring candidate that the client agrees on.** Two rules:

1. **It must move the metric from `strategic-alignment.md`.** No exceptions.
2. **It must finish in the sprint window** (typically 2 weeks). If it doesn't, downscope.

Ask the client: *"Of these top 3, which one — if it worked — would convince you to do the next phase?"*

That's the pilot.

## Output

Write to `memory/clients/{client-slug}/use-case-matrix.md`:

```markdown
# Use Case Matrix — {Client Name}

**Date:** YYYY-MM-DD
**Anchor metric (from strategic-alignment.md):** ...

## All candidates

| # | Step (from process-map) | Candidate | Impact | Effort | Time-to-value | Risk | Total |
|---|---|---|---|---|---|---|---|
| 1 | ... | ... | /5 | /5 | /5 | /5 | /20 |
| 2 | ... | ... | /5 | /5 | /5 | /5 | /20 |
| 3 | ... | ... | /5 | /5 | /5 | /5 | /20 |
| ... | ... | ... | ... | ... | ... | ... | ... |

## Top 3 (highest scores)
1. **{candidate}** — {one-line why}
2. ...
3. ...

## Selected pilot
**{Pilot name}**
- Why: ...
- Expected metric impact: ...
- Sprint window: 2 weeks
- Confidence: 🟢 High / 🟡 Medium / 🔴 Low

## Roadmap (high-impact / high-effort — not pilot)
1. ...
2. ...

## Backlog (low-impact / low-effort — quick wins later)
1. ...
```

## After writing

> Pilot selected. Now scope the sprint. Run `/agency-sprint-planner` to turn this pilot into a 2-week plan with daily milestones, success criteria, and tooling decisions.

## Boundaries

- Don't pick the pilot the *implementer* wants to build. Pick the one the *client* will defend.
- Don't pad the matrix with weak candidates to look thorough. List only real ones.
- High failure-mode risk = downscope or pick something else. Don't pilot something that could damage the client business.

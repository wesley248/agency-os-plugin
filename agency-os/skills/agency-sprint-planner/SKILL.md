---
name: agency-sprint-planner
description: Phase 3 of the Sprint Framework — turns a selected pilot into a 2-week sprint plan with daily milestones, success criteria, and tooling decisions. Mirrors the Blue Label / AAA 2.0 sprint planning methodology. Use when the user says "sprint plan", "plan the sprint", "phase 3", "design the pilot", or after picking a pilot from the use case matrix.
---

# Sprint Planner (Sprint Framework — Phase 3)

Turns the selected pilot from `use-case-matrix.md` into a concrete 2-week sprint plan. The output is the deliverable artifact you give the client at end of Phase 3 — and the document the implementer works against day-to-day.

## Inputs

Read:
- `memory/clients/{client-slug}/strategic-alignment.md` — the metric
- `memory/clients/{client-slug}/process-map.md` — the workflow context
- `memory/clients/{client-slug}/use-case-matrix.md` — the selected pilot
- `memory/automation-stack.md` — the agency's tools (what we'd build with)

If any are missing, route the user to the right phase.

## What a sprint plan contains

1. **Sprint goal** — one sentence. What does success look like at end of Day 14?
2. **Success criteria** — measurable, ranked. The metric must be one of them.
3. **Daily milestones** — what's done each day (or 2-day block)
4. **Tooling decisions** — what we're building it on (Claude, Make.com, Custom GPT, n8n, etc.)
5. **Data requirements** — what the client must provide, by when
6. **Risk register** — top 3 risks + mitigation
7. **Decision points** — moments the client must approve before we proceed
8. **Definition of done** — when do we declare "pilot worked"?

## Sprint shape (default)

A 2-week (10 working day) sprint. Adjust if pilot scope demands.

```
WEEK 1 — BUILD & VALIDATE
Day 1   Kickoff + data confirmation
Day 2   Architecture confirmed, scaffolding built
Day 3   Core agent / automation logic working in isolation
Day 4   First integration with a real data source
Day 5   Internal demo + Champion review

WEEK 2 — INTEGRATE & MEASURE
Day 6   Handoff with adjacent process steps
Day 7   Edge cases + failure modes handled
Day 8   Pilot runs against real client data (shadow mode)
Day 9   Side-by-side comparison vs. current process
Day 10  Pilot demo + Now-Next-Later roadmap (Phase 5 input)
```

## Output

Write to `memory/clients/{client-slug}/sprint-plan.md`:

```markdown
# Sprint Plan — {Client Name} — {Pilot Name}

**Sprint window:** YYYY-MM-DD → YYYY-MM-DD
**Implementer:** ...
**Champion:** ...

## Sprint goal
{one sentence}

## Success criteria (ranked)
1. **{Metric from strategic-alignment.md}** moves from X → Y
2. ...
3. ...

## Daily milestones
| Day | Deliverable | Owner | Decision needed? |
|---|---|---|---|
| 1 | ... | ... | ... |
| 2 | ... | ... | ... |
| ... | ... | ... | ... |
| 10 | Pilot demo + Now-Next-Later doc | ... | Go / no-go for retainer |

## Tooling
| Layer | Tool | Why |
|---|---|---|
| LLM | Claude Sonnet/Opus / GPT-4o / ... | ... |
| Glue | Make.com / n8n / Zapier / Claude Code | ... |
| Storage | Notion / Airtable / Postgres / ... | ... |
| Frontend | Custom GPT / web app / Slack bot / ... | ... |

## Data the client must provide
| Data | By when | Format |
|---|---|---|
| ... | Day 1 | ... |

## Risks
| Risk | Likelihood | Mitigation |
|---|---|---|
| ... | High/Med/Low | ... |

## Definition of done
✅ {Metric} measurably improved on real client data
✅ Champion + 1 user can demo it without the implementer
✅ Now-Next-Later roadmap delivered (Phase 5)
```

## After writing

> Sprint is planned. Send to the Champion for approval. When you're at Day 10 and the pilot is working, run `/agency-now-next-later` to map what's beyond the pilot.
>
> Want this exported as a client-facing PDF? I can render the plan in their voice via `/agency-sprint-proposal`.

## Boundaries

- Never plan a sprint longer than 14 days without explicit reason.
- Never let "tooling decisions" get pinned by the implementer's preferences — pin them by what actually serves the client's stack.
- If the success criteria don't include the metric from `strategic-alignment.md`, you're planning the wrong sprint. Stop and re-anchor.

---
name: agency-process-map
description: Phase 2 of the Sprint Framework — maps the client's critical process end-to-end before designing AI solutions. Identifies handoffs, manual steps, decision points, data sources, and bottlenecks. Mirrors the Blue Label / AAA 2.0 process mapping methodology. Use when the user says "process map", "map the process", "process mapping", "phase 2", or "before the sprint".
---

# Process Map (Sprint Framework — Phase 2)

You can't AI-ify a process you haven't mapped. Phase 2 captures the named critical process from `strategic-alignment.md` in concrete, step-level detail — every handoff, every manual step, every decision, every data source.

## Inputs

Read:
- `memory/clients/{client-slug}/strategic-alignment.md` — the named critical process from Q3
- `memory/automation-stack.md` — confirm what tools the client has

If `strategic-alignment.md` is missing, stop and direct user to `/agency-strategic-alignment`.

## The map (six things to capture per step)

For every step in the process, capture:

| # | Field | Example |
|---|---|---|
| 1 | **Step name** | "Lead receives form submission" |
| 2 | **Owner** | Who does it (person, role, or system) |
| 3 | **Tool/system** | Where it happens (HubSpot, Gmail, Slack) |
| 4 | **Input** | What triggers/feeds this step |
| 5 | **Output** | What comes out, and where it goes next |
| 6 | **Time / friction** | How long it takes, what makes it slow |

## Method

Walk through the process from **trigger event** to **completion event**. Don't accept jumps. If they say "...and then we send the proposal," push: *"Walk me from sales call to proposal sent — what specifically happens between those?"*

For each step, also flag:
- **Decision points** — where a human (or rule) makes a yes/no/which call
- **Handoffs** — where the work crosses person/team/system boundaries (highest friction)
- **Data sources** — where information enters the process (often the AI hook)
- **Manual repetition** — the same person doing the same shape of work

## Output

Write to `memory/clients/{client-slug}/process-map.md`:

```markdown
# Process Map — {Client Name} — {Process Name}

**Date:** YYYY-MM-DD
**Trigger event:** ...
**Completion event:** ...
**Critical metric (from strategic-alignment.md):** ...

## Steps

| # | Step | Owner | Tool | Input | Output | Time | Friction |
|---|---|---|---|---|---|---|---|
| 1 | ... | ... | ... | ... | ... | ... min | 🟢/🟡/🔴 |
| 2 | ... | ... | ... | ... | ... | ... min | ... |
| ... | ... | ... | ... | ... | ... | ... | ... |

## Handoffs (highest friction)
- Step {N} → Step {N+1}: ...

## Decision points
- Step {N}: {what gets decided, by whom, on what info}

## Data sources
- {data source} → consumed at step {N}

## Manual repetition (AI candidates)
- {step} — {how often, why painful}

## Total cycle time
- **Best case:** ...
- **Typical:** ...
- **Worst case:** ...
```

## After writing

> Process is mapped. Now we score AI opportunities. Run `/agency-use-case-matrix` to surface every automation candidate from this map and rank them.

## Boundaries

- Don't merge steps to make the map shorter — granularity is the value.
- Don't suggest AI solutions yet. That's the next phase. Map first.
- If the client glosses over a step ("...and then it just goes through approval..."), push for the actual mechanics.

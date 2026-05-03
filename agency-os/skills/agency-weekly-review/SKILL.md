---
name: agency-weekly-review
description: Friday retrospective across all five personas — what shipped, what slipped, what to commit to next week. Pulls from each persona and assembles a strategic weekly review. Use when the user says "weekly review", "friday retro", "week wrap", "weekly retro", or at the end of the week.
---

# Weekly Review

The Friday rhythm. Reflect, learn, commit.

## How it runs

Poll each persona with: *"What's the weekly review for the week ending {date}?"*

Personas in order:
1. `agency-head-of-sales` — pipeline movement, deals won/lost, upsells closed, lessons
2. `agency-head-of-delivery` — milestones hit, scope creep, client health, handovers
3. `agency-head-of-marketing` — content shipped, top performer, lead magnet conversions
4. `agency-head-of-operations` — cashflow, invoiced/collected, contracts signed, expenses
5. `agency-executive-assistant` — inbox health, follow-up debt, calendar load

Each persona returns:
- **Shipped this week** — what closed/landed/finished
- **Slipped** — what didn't happen and why
- **Insight** — one thing learned worth keeping
- **Next week commit** — top 1-2 priorities

## Assembly

```markdown
# Weekly Review — Week ending {date}

## Score
- Revenue closed: $...
- Pipeline added: $...
- Engagements live: ...
- Engagements handed over: ...

## What shipped
- Sales: ...
- Delivery: ...
- Marketing: ...
- Operations: ...

## What slipped
- ...
- ...

## Insights worth keeping
- ...

## Next week — committed priorities
1. ...
2. ...
3. ...

## Open decisions for the founder
- ...
```

## Capture loop

After delivering the review, ask:
> Want me to append this week's insights to `memory/lessons.md` so the personas learn over time?

If yes, append insights as dated entries — each persona reads them on subsequent invocations.

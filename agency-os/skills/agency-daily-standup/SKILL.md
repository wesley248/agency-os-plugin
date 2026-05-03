---
name: agency-daily-standup
description: Run the daily morning standup across all five personas — pulls a brief from each (Sales, Delivery, Marketing, Operations, EA) and assembles a single morning briefing for the founder. Use when the user says "daily standup", "morning brief", "standup", "what's on today", or starts the day.
---

# Daily Standup

The morning rhythm of the Agency OS. One command, one consolidated brief, five persona perspectives.

## How it runs

For each persona, invoke the skill and ask: *"What's the daily standup for {date}?"*

Personas to poll, in this order:
1. `agency-head-of-sales`
2. `agency-head-of-delivery`
3. `agency-head-of-marketing`
4. `agency-head-of-operations`
5. `agency-executive-assistant`

Each persona returns its standard standup format. You assemble the responses into a single brief.

## Output format

```markdown
# Morning Brief — {Day, Date}

## 🎯 Top 3 for today
{distill the 3 most important things across all personas}

---

## SALES
{output from head-of-sales standup}

## DELIVERY
{output from head-of-delivery standup}

## MARKETING
{output from head-of-marketing standup}

## OPERATIONS
{output from head-of-operations standup}

## EXECUTIVE ASSISTANT
{output from executive-assistant standup}

---

## ⚠️ Decisions needed from you
{any item flagged "needs human decision" from any persona}

## 📅 Calendar today
{from EA — meetings, blocks, conflicts}
```

## Resilience

- If a persona is missing context (e.g., no pipeline data loaded), it should say so rather than fabricate. Surface those gaps in the brief — they're real signal.
- If `memory/` is empty, stop and direct user to `/setup-agency-os`.

## Cadence advice

After producing the brief, ask:
> Want me to schedule this to run automatically each weekday morning? I can wire it into a scheduled task.

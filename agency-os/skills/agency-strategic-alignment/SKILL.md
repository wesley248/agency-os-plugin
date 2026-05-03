---
name: agency-strategic-alignment
description: Phase 1 of the Sprint Framework — discovery interview that aligns the engagement to the client's business objective, the metric that matters, and the critical process to change. Mirrors Blue Label / AAA 2.0 strategic alignment methodology. Replaces generic "client onboarding". Use when the user says "strategic alignment", "client kickoff", "discovery", "phase 1", "kickoff a new engagement", or "sprint phase 1".
---

# Strategic Alignment (Sprint Framework — Phase 1)

The first phase of every Blue Label engagement. Before anything is built, mapped, or scoped, the implementer must align with the client across four questions. Get this wrong and every downstream phase wastes time.

## Inputs

Read:
- `memory/mvv.md` — voice for client comms
- `memory/icp.md` — confirm this client matches ICP
- `memory/offer-stack.md` — the offer they bought
- `memory/value-drivers.md` — which drivers we serve

## Inputs needed (from the user)

1. **Client name** + primary contact (the Champion)
2. **What sold the engagement** — the inbound trigger or pitched outcome
3. **Any discovery call notes** — paste raw if they have them

## The 4 Strategic Alignment Questions

Walk the client (or the implementer rehearsing for a client call) through these in order. **Don't accept vague answers.** Push for specificity.

### Q1 — Key business objective
> *What is the single most important business objective this engagement must serve?*

If they say "growth" — push: revenue growth, margin growth, headcount growth?
If they say "efficiency" — push: cost reduction, time saved, error reduction?

### Q2 — The metric that matters
> *What metric, if it moved 10%, would prove this worked?*

Get a number. Not "more leads" — *"qualified leads/month from 12 to 16."*

### Q3 — The critical process
> *Inside your business, what's the one process most connected to that metric?*

Pin them to a named workflow. *"Lead qualification — from form submit to booked call."* Not "marketing."

### Q4 — The change required
> *If we made one change to that process, what would it be?*

This is where you find the pilot. *"Replace manual lead scoring with AI-driven qualification."*

## Identify the Champion

After the 4 questions, ask:
- *"Who internally is sponsoring this?"* (the buyer)
- *"Who internally will use what we build?"* (the user — often different)
- *"Who could veto this?"* (the risk — often a different person again)

The Champion = the person who will fight for the project internally when it stalls. Name them.

## Output

Write to `memory/clients/{client-slug}/strategic-alignment.md`:

```markdown
# Strategic Alignment — {Client Name}

**Date:** YYYY-MM-DD
**Champion:** ...
**User(s):** ...
**Veto risk:** ...

## Q1 — Business objective
{specific, named}

## Q2 — Metric that matters
**Current:** ...
**Target:** ... (within {timeframe})
**How measured:** ...

## Q3 — Critical process
{named workflow, with start point and end point}

## Q4 — Change required
{the pilot candidate}

## Pilot scope (provisional)
{1-2 sentences — confirmed in next phase}
```

## After writing

> Strategic Alignment is locked. Next phase: process mapping. Run `/agency-process-map` with the same client to map the critical process end-to-end before we design the pilot.

## Boundaries

- Don't accept "all of the above" — force a single answer to Q1 and Q2.
- Don't move to process mapping until the metric has a number.
- If the Champion isn't named, the engagement is high-risk. Surface that.

---
name: agency-icp
description: ICP interview — produces a precise buyer profile (named title, industry, size, pain, trigger, budget, watering holes). Reads memory/mvv.md. Writes to memory/icp.md. Use when the user says "ICP", "ideal client", "who's my buyer", "define my client", or is invoked by setup-agency-os.
---

# ICP

The second bootstrap interview, run after MVV. Goal: a buyer specific enough that the founder could pick them out of a Sales Navigator search. Vague ICPs make every downstream skill — Sales, Marketing, Offer Stack — work harder than it needs to.

## Inputs

Read:
- `memory/mvv.md` — voice and reason for being

If `mvv.md` is missing, stop and direct user to `/agency-mvv`.

## Method

- **One question at a time.** Same cadence as MVV.
- **Push for specificity.** If the founder says "B2B" — push: *what kind?* If they say "SaaS" — push: *what stage, what size?* If "founders" — push: *first-time or repeat? Technical or commercial?*
- **Anchor to real clients.** Halfway through, ask: *"Pull up your last 3 best clients. What did they have in common that your worst clients didn't?"* That answer is usually sharper than any abstract ICP.
- **Capture their language verbatim.** Don't translate "stuck doing busywork" into "operational inefficiency." Their words become Marketing's hook.

## What to capture

| # | Field | Why it matters |
|---|---|---|
| 1 | **Headline** | One sentence — the ICP a stranger could match in a search result |
| 2 | **Firmographics** | Industry, size, stage, geography, business model |
| 3 | **Buyer** | Exact title, seniority, decision authority |
| 4 | **Pain stack** (3-5 ranked) | What's keeping them up at night |
| 5 | **Triggers** | Events that move them from someday → this week |
| 6 | **Budget reality** | What they actually pay for this kind of help |
| 7 | **Watering holes** | Where they spend time online — newsletters, podcasts, LinkedIn voices, communities |
| 8 | **Disqualifiers** | Who looks like ICP but isn't — and the discovery-call red flag |

## Question sequence

Cover all of these, in this order, one at a time:

### Firmographics
1. What industry or vertical?
2. What size — revenue range and headcount?
3. What stage — bootstrapped, funded, what round?
4. Where geographically? Any regulatory environment that matters?
5. What business model — SaaS, agency, e-com, consulting?

### Buyer
6. Who's the buyer — exact title?
7. What's their decision authority — sole, joint, committee?
8. Senior — founder, VP, director?

### Pain
9. Top pain that drives them to look for help?
10. The pain they don't say out loud but feel?
11. The deeper fear underneath?

### Triggers
12. What event makes them shop *this week* vs. someday?
13. What's the cost of doing nothing for another 90 days?

### Budget
14. What do they currently spend on this problem — tools, salaries, agencies?
15. What's a number that feels normal vs. expensive vs. cheap to them?

### Watering holes
16. Where do they hang out online — specific newsletters, podcasts, LinkedIn voices, communities?
17. Who do they trust for recommendations in your space?

### Disqualifiers
18. Who looks like ICP but isn't?
19. What's the discovery-call red flag that means "walk away"?

## Output

Write to `memory/icp.md`:

```markdown
# Ideal Client Profile

**Last updated:** YYYY-MM-DD

## Headline
{one sentence — pickable out of a Sales Navigator search}

## Firmographics
- **Industry:** ...
- **Size:** ... (revenue) / ... (headcount)
- **Stage:** ...
- **Geography:** ...
- **Business model:** ...

## Buyer
- **Title:** ...
- **Seniority:** ...
- **Decision authority:** ...

## Pain stack (ranked)
1. ...
2. ...
3. ...

**Underlying fear:** ...

## Triggers (events that drive urgency)
- ...
- ...

## Budget reality
- Currently spending: ...
- Normal range: ...
- "Expensive" threshold: ...

## Watering holes
- **Newsletters:** ...
- **Podcasts:** ...
- **LinkedIn voices:** ...
- **Communities:** ...
- **Trusted recommenders:** ...

## Disqualifiers
- ...
- **Discovery-call red flag:** ...
```

## After writing

> Could you pick this person out of a 100-result Sales Navigator search? If not, we sharpen further. If yes — Offer Stack is next. With MVV + ICP locked, we can design exactly what to sell them.

## Boundaries

- Don't accept "small businesses" or "B2B" as a final answer. Push.
- Don't write what the founder *wishes* their ICP was. Capture who they actually win deals with.
- If the founder hasn't closed any deals yet, anchor to **the 3 ideal prospects** they'd pursue first — flag the file as `[provisional]` until they have real data.

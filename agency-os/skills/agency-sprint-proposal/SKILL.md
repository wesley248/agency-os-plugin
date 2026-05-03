---
name: agency-sprint-proposal
description: Generates a branded proposal document from offer + ICP + prospect details — pulls structure from offer.md and personalizes for the specific prospect. Outputs Markdown proposal ready for export to PDF or doc. Use when the user says "draft a proposal", "create proposal", "proposal for X", "write proposal", or is invoked by Head of Sales.
---

# Proposal Generator

Turns the published offer into a personalized proposal for a specific prospect — in 10 minutes, in voice, with the right pricing tier.

## Loading context

Read:
- `memory/mvv.md` — voice, advantage
- `memory/icp.md` — confirm prospect fit
- `memory/offer-stack.md` — inclusions, timeline, pricing
- `memory/value-drivers.md` — pre-sale upsell paths

## Inputs needed

Ask the user for (or extract from a pasted brief):
1. **Prospect name** — company + buyer
2. **Trigger** — what made them reach out (event, frustration, growth)
3. **Their words** — copy-paste of any discovery call notes / inbound email
4. **Tier** — Starter / Standard / Premium (or recommend based on signals)
5. **Custom inclusions** — anything bespoke negotiated mid-call
6. **Timeline** — preferred start date

## Output structure

```markdown
# Proposal for {Prospect Name}

**Prepared by:** {Agency Name}
**Date:** {YYYY-MM-DD}
**Valid until:** {YYYY-MM-DD + 14 days}

## What we heard

{2-3 sentences mirroring back the trigger and pain in their words}

## What you'll have when this is done

{outcome from offer.md, framed for their context}

## How we'll get there

| Week | Milestone | Deliverable |
|---|---|---|
| 1 | ... | ... |
| 2 | ... | ... |

## What's included

{from offer.md inclusions, lightly customized}

## What's not included

{from offer.md exclusions — explicit, no surprises}

## Investment

**${tier price}** — {tier name}

Payment terms: {from offer.md}

## Why us, why now

{advantage from agency-dna.md, mapped to their trigger}

## Next steps

1. Reply with "approved" or questions
2. We send a contract within 24 hours
3. Kickoff scheduled for {timeline}

---

{Founder name}, {Agency Name}
```

## Voice rules

- Mirror the prospect's language in "What we heard" — use their words, not yours
- Keep "Investment" punchy — never "starting from" or "depending on scope"
- End with a clear CTA, not a passive "let me know your thoughts"

## After generating

- Show the user the draft
- Ask: *"Approve to convert to PDF? Edit voice? Adjust tier? Add custom inclusions?"*
- Save to `outputs/proposals/{prospect-name}-{date}.md`

## Boundaries

- Never invent inclusions not in `offer.md` without explicit user direction
- Never quote a price below the published tier without flagging "this is a discount that needs founder approval"
- Never commit to a timeline that breaks `offer.md`'s published timeline

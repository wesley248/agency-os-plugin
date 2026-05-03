---
name: agency-content-engine
description: Generates a week of content (LinkedIn posts, newsletter, lead magnet ideas) tailored to the agency's voice, ICP pain stack, and value stack CTAs. Use when the user says "week of content", "content engine", "content plan", "draft this week's posts", or invoked by Head of Marketing.
---

# Content Engine

Produces a publish-ready week of content in voice, on-pain, with funnel-aware CTAs.

## Loading context

Read:
- `memory/mvv.md` — voice (mandatory match)
- `memory/icp.md` — pain stack, watering holes, language
- `memory/offer-stack.md` — what we're indirectly selling
- `memory/value-drivers.md` — pre-sale offers (audit/workshop) for CTAs

## Output: a week of content

5 LinkedIn posts + 1 newsletter draft + 1 lead magnet idea, each tied to a different angle:

| Day | Format | Angle | Pain (from icp.md) | CTA (from value-stack.md) |
|---|---|---|---|---|
| Mon | LinkedIn post | Belief shift | Pain #1 | Audit signup |
| Tue | LinkedIn post | Mistake post | Pain #2 | DM keyword |
| Wed | LinkedIn post | Result / case study | Pain #1 | Discovery call |
| Thu | LinkedIn post | Framework | Pain #3 | Workshop |
| Fri | LinkedIn post | Personal POV | Founder voice | Newsletter signup |
| Weekly | Newsletter (500-800 words) | Synthesis of week | All | Audit |
| Weekly | Lead magnet idea | Diagnostic / template | Pain #1 | Email capture |

## Per-post structure

```
**Hook** (first line — must stop scroll, no "I'm excited")
{1-2 lines}

**Body**
{3-5 short paragraphs, no fluff}

**CTA**
{specific, tied to value-stack pre-sale}
```

## Voice gates

Before delivering, self-check:
- ✅ Does this sound like the adjectives in agency-dna.md?
- ✅ Does it speak to a real pain in icp.md (not generic)?
- ✅ Is the CTA tied to a real next step in value-stack.md?
- ❌ Is it using "leverage", "synergy", "unlock potential", or other corporate dead-words?

## After generating

Save to `outputs/content/{week-of-YYYY-MM-DD}/` and ask:
> Want me to schedule any of these? Or do you want to revise voice first?

## Boundaries

- Never publish anything without explicit human approval
- Never invent client results or quotes — flag if a post needs a real case study you don't have yet
- Keep posts short — long-form goes in the newsletter, not LinkedIn

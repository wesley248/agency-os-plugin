---
name: agency-value-drivers
description: Maps the agency's offerings against the 8 Value Drivers framework (Strategy/Assets, Operations, Data/Innovation, Creative/Brand, Finance/Legal, CX, Monetization, People/Culture) — clarifies which departments the agency primarily serves and derives pricing tiers from that positioning. Reads memory/mvv.md, memory/icp.md, memory/offer-stack.md. Writes to memory/value-drivers.md. Use when the user says "value drivers", "8 value drivers", "departmental positioning", "pricing tiers", "value ladder", or is invoked by setup-agency-os.
---

# Agency Value Drivers

Every department in a client company contributes to one or more of **8 core Value Drivers**. Your agency's positioning gets sharper — and pricing easier — when you know which 1-3 drivers you primarily impact, and at what depth.

This interview does two things:
1. Maps which of the 8 Value Drivers the agency primarily serves
2. Derives the agency's pricing ladder (entry → core → premium) from that positioning

## Inputs

Read:
- `memory/mvv.md`
- `memory/icp.md`
- `memory/offer-stack.md`

If `offer-stack.md` is missing, stop and direct user to `/agency-offer-stack`.

## The 8 Value Drivers

Walk the founder through these. For each, ask: *"On a scale of 1-5, how core is this to what your agency delivers for clients?"*

| # | Driver | Represents | Example agency contributions |
|---|---|---|---|
| 1 | **Strategy, Assets & IP** | Strategic direction, proprietary frameworks, long-term positioning | Strategic planning, business models, IP / framework licensing |
| 2 | **Operations & Profitability** | The engine room — how the business runs, costs, delivery | SOPs, workflow design, automation, vendor mgmt |
| 3 | **Data & Innovation** | Data → insight → smarter decisions, future solutions | Analytics, R&D, AI/ML use cases, knowledge mgmt |
| 4 | **Creative & Brand** | Identity, positioning, storytelling, emotional connection | Brand guidelines, content production, design systems |
| 5 | **Finance & Legal** | Risk, compliance, cash flow, fiscal control | Budgeting, contracts, compliance frameworks |
| 6 | **Customer Experience & Communication** | Customer trust, relationships, journey | CX design, CRM, journey mapping, support systems |
| 7 | **Monetization & Profit** | Revenue models, monetization, commercial leverage | Pricing, funnels, productization, upsell systems |
| 8 | **People & Culture** | Internal environment, talent, alignment with purpose | Hiring, onboarding, training, culture rituals |

## Method

Pace it. Ask the rating question one driver at a time. After each rating, ask one follow-up: *"What specifically do you do for clients in that area?"* Capture their language verbatim.

## Synthesis

After all 8 ratings:

1. **Identify the 1-3 primary drivers** (anything rated 4-5)
2. **Identify the 2-3 supporting drivers** (rated 3)
3. **Confirm the rest are out of scope** (rated 1-2 — these are referrals, not deliverables)

## Pricing ladder from positioning

Once primary drivers are clear, build the ladder:

| Tier | Purpose | Pricing range | Maps to drivers |
|---|---|---|---|
| **Entry** (audit / diagnostic / workshop) | Test the relationship, prove value cheaply | $... | Touch the primary driver |
| **Core** (the main offer from offer-stack.md) | Solve the primary problem in the primary driver | $... | Primary driver(s) deeply |
| **Premium / Retainer** | Multi-driver, ongoing, high-touch | $.../mo | Primary + supporting |

Then map:
- **Cross-sells** — adjacent offers a client buys alongside the core
- **Refer-outs** — work outside your driver scope, with a named partner

## Output

Write to `memory/value-drivers.md`:

```markdown
# Value Drivers & Pricing Ladder

**Last updated:** YYYY-MM-DD

## Driver scoring (1-5)

| # | Driver | Score | What we do here |
|---|---|---|---|
| 1 | Strategy, Assets & IP | / | ... |
| 2 | Operations & Profitability | / | ... |
| 3 | Data & Innovation | / | ... |
| 4 | Creative & Brand | / | ... |
| 5 | Finance & Legal | / | ... |
| 6 | Customer Experience & Communication | / | ... |
| 7 | Monetization & Profit | / | ... |
| 8 | People & Culture | / | ... |

## Primary drivers (4-5)
- ...
- ...

## Supporting drivers (3)
- ...

## Out-of-scope (1-2 — refer out)
- ...

## Pricing ladder

### Entry — {audit / diagnostic / workshop name}
- **Price:** $...
- **Solves:** ...
- **Converts to core at:** ...%

### Core — {the productized offer from offer-stack.md}
- **Price:** $...
- **Solves:** ...

### Premium / Retainer
- **Price:** $.../month
- **For:** ...

## Cross-sells (bought alongside core)
- ...

## Refer-outs (we don't sell — we send)
| Service | Refer to | Partnership terms |
|---|---|---|
| ... | ... | ... |

## Lifetime value
- **Typical 12-month client value:** $...
- **Top 10% client value:** $...
```

## After writing

> Now your personas have the full positioning + economic picture. Sales knows which driver to lead with. Marketing knows which language resonates. Delivery knows where scope ends. Last interview is your automation stack — quick one.

## Boundaries

- Don't pressure the founder to score a driver high if they don't operate there.
- Don't invent pricing — anchor to what's already in offer-stack.md and the founder's lived market.
- Refer-outs are real revenue (partnership fees) — capture them, don't dismiss them.

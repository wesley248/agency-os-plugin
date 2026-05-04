# The Agency OS — Every Agent and What It Does

A complete tour of the 25 agents (skills) inside the Agency Operating System Claude Code plugin. This document is structured for slide deck generation: each agent is a one-slide unit, grouped by the layer it operates in.

---

## What is the Agency OS?

The Agency OS is an installable Claude Code plugin that turns Claude into a personalized **operating system for a service-based agency**. It bundles 25 AI agents that interview the founder, capture the agency's identity, then run as functional team members — Head of Sales, Head of Delivery, Head of Marketing, Head of Operations, and an Executive Assistant — alongside a six-phase delivery framework for client engagements.

It's built on the methodologies students already know from **Industry Rockstar** and the **AI Assisted Agency Accelerator**: CorePilot for Mission/Vision/Values, the Offer Stack Agent for productized offer design, the 8 Value Drivers framework for departmental positioning, and Blue Label's Sprint Framework for client delivery.

The plugin installs in two minutes, configures itself through guided interviews in another ninety, and from that point on every agent speaks in the founder's voice, references their actual offer and ICP, and operates by their stated values.

---

## The Six Layers

The Agency OS organizes 25 agents into six layers:

0. **Home Base (1 agent)**: The roadmap — assessment, persistent tracker, and personalized navigator. The first thing students see and the place they come back to.
1. **Layer 0 — Orchestrator (1 agent)**: Walks the founder through the full linear bootstrap.
2. **Layer 1 — Bootstrap Interviews (5 agents)**: One-time interviews that populate the agency's strategic foundation. Each writes a memory file every other agent reads from.
3. **Layer 2 — Personas (5 agents)**: Functional team roles that read the memory and operate in the founder's voice.
4. **Layer 3 — Rhythms and Workflows (6 agents)**: Repeatable jobs — daily standups, weekly reviews, proposals, content, transcripts.
5. **Layer 4 — Sprint Framework (6 agents)**: Per-client engagement methodology, six phases from kickoff to retainer.
6. **Layer 5 — Pillar Tools (2 agents)**: Positioning hooks and signature methodology builders from the Rockstar Advisor pillars.

What follows is one section per agent. Read in order or jump to any layer.

---

# Home Base — The Roadmap

## agency-roadmap

**The home base. Run this anytime to figure out where you are, what's done, and what to focus on next.**

Three modes in one skill. **First-time mode** runs a 12-question diagnostic across every layer of the OS — Mission/Vision/Values clarity, ICP precision, offer maturity, value-driver positioning, automation health, audio logo, methodology, pipeline, delivery, content, ops, active client engagements, and a final open question on the founder's biggest blocker. **Status-check mode** reads the existing roadmap, scans the actual memory files to detect ground truth, refreshes statuses, and shows what's changed since last time. **Quick-answer mode** returns just one line: the single recommended next action.

The roadmap also functions as the alternative entry path. Students new to the OS can either start with `/setup-agency-os` for the structured linear bootstrap, or start with `/agency-roadmap` to take the assessment first and get a personalized roadmap. Both paths lead to the same configured OS — but assessment-driven works better for founders who've already done some of the work elsewhere or want the highest-leverage thing first instead of going in order.

**What it produces:** `memory/roadmap.md` — a persistent tracker showing completion status across all five layers, last-updated dates, active client engagement phases, the latest assessment snapshot, the recommended next action, and a full prioritized roadmap. Auto-updates every time the skill runs.

**When to run it:** Anytime. First-time setup, weekly check-ins, after long idle periods, whenever you feel lost. This is the home base of the OS.

**Slash command:** `/agency-roadmap`

---

# Layer 0 — The Orchestrator

## setup-agency-os

**The starting point. Run this first.**

Walks a brand-new founder through the full bootstrap in 60 to 90 minutes. Invokes the five interview agents in sequence — MVV, ICP, Offer Stack, Value Drivers, Automation Audit — and confirms each output before moving on. By the end, the agency's `memory/` folder is populated and every persona is ready to operate.

**What it produces:** Five completed memory files plus a confirmed handoff to live use.

**When to run it:** Once, when the agency installs the plugin. Re-run sections later to refresh as the agency evolves.

**Slash command:** `/setup-agency-os`

---

# Layer 1 — Bootstrap Interviews (5 agents)

These are the agents that capture **who the agency is**. Each one runs a focused interview and writes a memory file. Every other agent in the OS reads from this folder.

## agency-mvv (Mission, Vision, Values)

**The voice and reason for being.**

Methodology source: **CorePilot** — the same MVV interview structure used across Industry Rockstar's coaching engagements. Asks 3–5 questions per section, one at a time, then synthesizes 3–5 mission options, 3–5 vision options, and 5–8 candidate values for the founder to pick from, edit, or combine. The output is the agency's voice signature — every persona reads this file and matches the tone defined here.

**What it produces:** `memory/mvv.md` containing mission, vision, 5–8 named values with definitions, and a voice signature (three adjectives plus a "we sound like X, not Y" contrast line).

**When to run it:** First in the bootstrap. Refresh quarterly as voice and vision drift.

**Slash command:** `/agency-mvv`

## agency-icp (Ideal Client Profile)

**The buyer, in operational detail.**

Pushes past vague answers like "small businesses" or "B2B founders" until the founder can pick their ICP out of a Sales Navigator search. Captures firmographics, buyer title and decision authority, ranked pain stack, urgency triggers, budget reality, watering holes (newsletters, podcasts, LinkedIn voices, communities), and disqualifiers — the people who look like ICP but aren't.

**What it produces:** `memory/icp.md` — a structured buyer profile complete enough to drive sales, marketing, and qualification decisions across every persona.

**When to run it:** Second in the bootstrap, after MVV. Re-run after every 5+ deals lost (the ICP is probably wrong).

**Slash command:** `/agency-icp`

## agency-offer-stack (Productized Offer Design)

**Problem map → offer stack → positioning.**

Methodology source: **Offer Stack Agent** from Industry Rockstar. Three-part interview: first map the audience's problem hierarchy (primary problem plus 3–5 secondary barriers plus 3–5 tertiary beliefs), then design solutions at each layer (Core Program, Support Components, Bonuses, Premium Upsell), then derive three positioning angles aligned to the deepest pains. Outputs an Offer Stack Breakdown Table with each inclusion priced, plus a Gamma-ready slide description.

**What it produces:** `memory/offer-stack.md` — the productized service blueprint, complete with pricing, inclusions, exclusions, and positioning taglines.

**When to run it:** Third in the bootstrap. Re-run after pricing tests or when the offer evolves.

**Slash command:** `/agency-offer-stack`

## agency-value-drivers (8 Value Drivers + Pricing Ladder)

**Departmental positioning + pricing tiers in one interview.**

Methodology source: the **8 Value Drivers** framework — Strategy/Assets/IP, Operations/Profitability, Data/Innovation, Creative/Brand, Finance/Legal, Customer Experience, Monetization, People/Culture. The founder rates each driver 1–5 for how core it is to what they deliver. The 1–3 highest-scored drivers become the agency's positioning anchor. Then the interview derives a three-tier pricing ladder (Entry / Core / Premium) plus cross-sells, post-sales retainer paths, and refer-out partnerships.

**What it produces:** `memory/value-drivers.md` — driver scoring, primary positioning, full pricing ladder, and lifetime client value projection.

**When to run it:** Fourth in the bootstrap. Re-run when the agency expands service offerings.

**Slash command:** `/agency-value-drivers`

## agency-automation-audit (Tool Stack Inventory)

**What's automated, what's manual, where AI plugs in.**

A 10-minute audit of the agency's own operations across CRM, email, calendar, comms, project management, automation glue (Zapier/n8n/Make), AI tools, accounting, meetings, and transcription. Captures what's already in the stack so personas don't recommend tools the agency uses (or worse, conflict with them). Identifies manual hotspots as AI-ification candidates and surfaces what's broken.

**What it produces:** `memory/automation-stack.md` — current tool inventory by category, manual hotspots, gaps, and which MCP integrations are available for the existing stack.

**When to run it:** Fifth and last in the bootstrap. Re-run whenever a tool changes.

**Slash command:** `/agency-automation-audit`

---

# Layer 2 — Personas (5 agents)

These are the functional team roles — five Heads-of and an Executive Assistant. Each one reads `memory/` on every invocation and operates in the founder's voice, with knowledge of the agency's offer, ICP, pricing, and tools. They participate in daily standups and weekly reviews. Each persona has clear ownership boundaries and explicit handoff rules to the others.

## agency-head-of-sales

**Pipeline, qualification, proposal triage.**

Owns the path from qualified lead to closed deal. Qualifies prospects against the ICP using a four-dimensional check: firmographic match, pain match, trigger present, budget reality. Drafts outreach in the agency's voice using ICP pain language. Quotes prices from the offer stack, never invents discounts. Flags stale deals, surfaces upsell opportunities at delivery handover. Routes proposal drafting to the sprint-proposal workflow rather than writing them inline.

**Use it when:** "What should I work on this week?" / "Qualify this lead" / "Should I take this client?" / "Draft outreach to X" / "How do I close this?"

**Slash command:** `/agency-head-of-sales`

## agency-head-of-delivery

**Client work, project plans, scope management.**

Owns delivery from kickoff through handover. Translates signed proposals into project plans, tracks milestones against the offer's published timeline, manages scope boundaries, and produces weekly client status updates in the agency's voice. Flags scope creep before it becomes hostile, surfaces handover opportunities for retainer or Phase 2 conversations. Never approves scope changes unilaterally — flags them and routes the decision to the founder and Head of Sales.

**Use it when:** "Delivery update" / "Project status" / "Client status" / "Scope creep" / "Kickoff plan."

**Slash command:** `/agency-head-of-delivery`

## agency-head-of-marketing

**Top-of-funnel demand, brand voice, content engine.**

Owns LinkedIn presence, newsletter, lead magnets, and inbound. Every piece of content references the pain stack from the ICP file, uses language captured verbatim from the founder's interviews, and ends with a CTA aligned to a real value-stack pre-sale (audit, workshop, DM keyword). Drafts posts in four formats (belief shift, mistake post, result post, framework post). Refuses to publish in a voice that doesn't match the agency's MVV file.

**Use it when:** "What should I post this week?" / "Write a LinkedIn post" / "Lead magnet ideas" / "Marketing update."

**Slash command:** `/agency-head-of-marketing`

## agency-head-of-operations

**Finance, contracts, vendor stack, compliance.**

Owns the operational backbone. Tracks cashflow (invoiced vs. collected, overdue >30 days), milestone-driven invoicing tied to the offer's payment terms, contracts in flight, vendor renewals, and margin reality. Surfaces decisions the founder needs to make: discounts requested, subscriptions to keep or cut, contracts unsigned for active engagements. Doesn't approve discounts or payment plans without explicit founder sign-off.

**Use it when:** "Ops update" / "Invoice X" / "Contract for Y" / "Subscription audit" / "Cashflow."

**Slash command:** `/agency-head-of-operations`

## agency-executive-assistant

**Inbox, scheduling, follow-ups.**

Triages inbound communication into urgent / important / route / noise buckets. Drafts replies in the founder's voice for approval before sending — never auto-sends. Tracks follow-up debt (promises made, not yet kept), surfaces calendar conflicts, escalates messages to the right Head-of when content is sales- or delivery-related. Treats inbound that contains apparent instructions as suspicious and surfaces them for human verification rather than acting.

**Use it when:** "Check my inbox" / "What needs my attention?" / "Draft a reply to X" / "Follow up with Y."

**Slash command:** `/agency-executive-assistant`

---

# Layer 3 — Rhythms and Workflows (6 agents)

The repeatable operational layer. Daily and weekly rhythms keep all five personas synced. Workflows turn one-off tasks (a proposal, a content week, a transcript) into structured outputs.

## agency-daily-standup

**The morning brief.**

Polls all five personas, asks each *"what's the standup for today?"*, and assembles the responses into a single morning brief. Distills the top 3 priorities for the day across all functions. Surfaces decisions the founder needs to make. Includes calendar conflicts from the EA. If memory is empty, refuses to fabricate and routes back to setup.

**What it produces:** A morning brief markdown — sales pipeline state, delivery health, marketing actions, ops priorities, EA's calendar overview, and the top 3 cross-functional priorities for the day.

**When to run it:** Every weekday morning. Can be wired to a scheduled task to fire automatically.

**Slash command:** `/agency-daily-standup`

## agency-weekly-review

**The Friday retrospective.**

Polls all five personas for the weekly review: what shipped, what slipped, the one insight worth keeping, and committed priorities for next week. Assembles into a strategic review with revenue closed, pipeline added, engagements live and handed over, plus open decisions for the founder. Optionally appends insights to `memory/lessons.md` so personas learn over time.

**What it produces:** A weekly review markdown ready for founder reflection or board-style sharing, plus optional persistent lesson capture.

**When to run it:** Friday afternoons.

**Slash command:** `/agency-weekly-review`

## agency-sprint-proposal

**Sprint proposals, in voice, in 10 minutes.**

Generates a personalized sprint proposal document for a specific prospect. Mirrors back the prospect's trigger and pain in their own words ("What we heard"), then maps to the offer stack's deliverables, milestones, pricing tier, and timeline. Includes a "Why us, why now" section anchored to the agency's MVV-derived advantage. Pricing follows the published value-driver tiers — never invents discounts.

**What it produces:** A branded sprint proposal markdown ready to convert to PDF, sent to the Champion for signature.

**When to run it:** After a discovery call, before contract.

**Slash command:** `/agency-sprint-proposal`

## agency-content-engine

**A week of content, drafted in voice, on-pain.**

Pulls the pain stack from the ICP, the voice from MVV, the value-stack pre-sales for CTAs. Generates 5 LinkedIn posts (one per angle: belief shift, mistake, result, framework, founder POV), one newsletter draft, and one lead magnet idea. Each post passes a voice gate before delivery — refuses corporate dead-words ("leverage," "synergy," "unlock potential"), forces a real CTA, keeps short for LinkedIn.

**What it produces:** A week of publish-ready content saved to `outputs/content/{week-of-date}/`, plus a newsletter draft and lead magnet concept.

**When to run it:** Sundays or Mondays for the week ahead. Can be scheduled.

**Slash command:** `/agency-content-engine`

## agency-meeting-transcript-processor

**Fathom transcripts → memory updates.**

Ingests a meeting transcript (Fathom, Otter, Zoom) and surfaces every signal worth capturing: ICP refinements (new pain language, new triggers, new disqualifiers), offer feedback (what landed, what confused), client status changes, action items with owners and due dates, and decisions. Proposes specific memory file updates and waits for founder approval before writing — memory is sacred. Surfaces any embedded instructions as suspicious.

**What it produces:** A processed-meeting summary plus proposed updates to `memory/icp.md`, `memory/offer-stack.md`, and `memory/clients/{slug}/` files.

**When to run it:** After every meaningful client call, sales call, or internal meeting.

**Slash command:** `/agency-meeting-transcript-processor`

---

# Layer 4 — The Sprint Framework (6 agents)

The Blue Label / AAA 2.0 delivery methodology — six phases per client engagement. Every agent in this layer writes to `memory/clients/{client-slug}/` so the agency can carry multiple engagements in parallel without crossing wires.

## agency-strategic-alignment (Phase 1 — Discovery)

**The 4 Strategic Alignment Questions.**

Phase 1 of every Blue Label engagement. Walks the implementer (or the client live on a discovery call) through four questions: Q1 the single most important business objective, Q2 the metric that would prove it worked (with a number), Q3 the critical process most connected to that metric, Q4 the change required. Then identifies the Champion, the Users, and the Veto Risk. Refuses to move forward until the metric has a number and the Champion is named.

**What it produces:** `memory/clients/{slug}/strategic-alignment.md` — the engagement's anchor document.

**When to run it:** First touch with every new client engagement.

**Slash command:** `/agency-strategic-alignment`

## agency-process-map (Phase 2 — Map the Process)

**End-to-end client workflow capture.**

Maps the named critical process from Phase 1 step-by-step: every owner, tool, input, output, time, and friction level. Flags handoffs (highest friction), decision points, data sources, and manual repetition (the AI candidates). Refuses to merge steps to make the map shorter — granularity is the point. Pushes past glossed-over steps ("...and then it goes through approval") to capture actual mechanics.

**What it produces:** `memory/clients/{slug}/process-map.md` — a full step-table with handoffs, decisions, data sources, and total cycle time.

**When to run it:** Immediately after Phase 1, before designing any pilot.

**Slash command:** `/agency-process-map`

## agency-use-case-matrix (Phase 2.5 — Pilot Selection)

**Score AI opportunities, pick the pilot.**

Bridges the process map to the sprint plan. Surfaces every automation candidate from the process map, scores each across four dimensions (impact on metric, implementation effort, time-to-value, risk of failure) for a max score of 20. Plots them on the classic 2x2 (impact vs. effort). Pilot = the highest-scoring candidate the client will defend, not the one the implementer wants to build. Refuses pilots that exceed the 2-week sprint window or carry high failure-mode risk.

**What it produces:** `memory/clients/{slug}/use-case-matrix.md` — full candidate matrix, top 3 ranked, selected pilot with confidence rating, plus a roadmap and backlog for non-pilot candidates.

**When to run it:** After Phase 2 mapping, before sprint planning.

**Slash command:** `/agency-use-case-matrix`

## agency-sprint-planner (Phase 3 — Design the Pilot)

**The 2-week pilot plan.**

Turns the selected pilot into a concrete 2-week sprint with daily milestones, success criteria, tooling decisions, data requirements from the client, a risk register, decision points, and a definition of done. Defaults to the Build-Validate-Integrate-Measure week pattern. Refuses sprints longer than 14 days without explicit reason. Pins tooling to what serves the client's stack, not the implementer's preferences.

**What it produces:** `memory/clients/{slug}/sprint-plan.md` — the deliverable artifact handed to the client at end of Phase 3.

**When to run it:** Once a pilot is selected from the matrix.

**Slash command:** `/agency-sprint-planner`

## agency-now-next-later (Phase 5 — Phased Roadmap)

**The artifact that sells the retainer.**

Delivered at the end of the pilot. Translates pilot results into three buckets: NOW (live and proven), NEXT (highest-impact extensions to commit to in the next 30–90 days), LATER (strategic horizon items). Maps each NEXT initiative to a value driver, sprint length, price, and dependency. Projects metric movement across all three time horizons so the client can see the full opportunity. Refuses to oversell LATER — vague future possibilities erode trust.

**What it produces:** `memory/clients/{slug}/now-next-later.md` — the document that converts a one-off pilot into ongoing engagement.

**When to run it:** End of Phase 4 (build), as Phase 5 deliverable.

**Slash command:** `/agency-now-next-later`

## agency-retainer-architect (Phase 6 — Transfer to Retainer)

**Pilot to ongoing retainer.**

Picks one of four retainer shapes (Hours Pool / Sprint Subscription / Outcome-Based / Embedded Fractional), then designs scope boundaries (especially what's OUT — scope creep kills retainers), comms cadence (weekly check-in, monthly steering, quarterly review, async channel), success metrics tied to the original Phase 1 anchor, pricing structure, and an off-ramp. Always includes an off-ramp because clients commit harder when they can leave.

**What it produces:** `memory/clients/{slug}/retainer.md` — a structured monthly engagement contract ready for Champion sign-off.

**When to run it:** When the client decides to commit to NEXT after seeing Now-Next-Later.

**Slash command:** `/agency-retainer-architect`

---

# Layer 5 — Pillar Tools (2 agents)

From the Rockstar Advisor pillars. These build the assets that turn a service business into a recognizable, sellable brand.

## agency-audio-logo

**The 7-second positioning hook.**

Pillar 1 of the Rockstar Advisor system. Generates 3–5 audio logo options each under 7 seconds spoken (~18–22 words). Uses three formulas (For/Who/I, Outcome-First, Provocation), pressure-tests each option against four gates (stranger test, search test, curiosity test, voice test), then derives 30-second, 60-second, and DM-opener variants from the winning logo. Refuses corporate dead-words. Always offers multiple alternatives.

**What it produces:** `memory/audio-logo.md` — the hook used at the top of every discovery call, in DMs, on podcasts, in Marketing's content openers.

**When to run it:** Once the bootstrap is complete and the founder needs sharp positioning copy.

**Slash command:** `/agency-audio-logo`

## agency-methodology

**The branded signature framework.**

Builds the named, visualized methodology that turns intangible expertise into defensible IP. Generates 5–8 candidate names (acronym, number-led, metaphor-led, verb-first patterns), picks the right phase count (4–7 — the sweet spot), defines outcomes and signature deliverables per phase, and writes the 90-second teaching version the founder can drop on a sales call. Maps each phase to a Sprint Framework phase and the plugin skill that runs it — making the methodology real, not just a graphic.

**What it produces:** `memory/methodology.md` — the named system the agency sells, plus a render description for Gamma or a designer to produce the visual asset.

**When to run it:** When the founder is ready to productize their unique approach. Often run after a few client engagements when patterns become clear.

**Slash command:** `/agency-methodology`

---

# How It All Fits Together

**The bootstrap creates the foundation.** Five interviews populate the agency's strategic memory in 60–90 minutes. From that point, every persona reads from this memory on every invocation, so they always speak in the founder's voice with current knowledge of the offer, ICP, and tools.

**The personas run the agency day-to-day.** Each Head-of operates in their lane with explicit ownership, escalation rules, and handoffs. The EA triages everything inbound. Together they handle the operational baseline of a service business — pipeline, delivery, content, ops, and admin.

**The rhythms keep them synced.** Daily standup pulls from all five personas in the morning. Weekly review surfaces what shipped, slipped, and learned. The content engine, sprint proposal generator, and meeting transcript processor handle the regular high-leverage outputs.

**The Sprint Framework runs every client engagement.** Six phases per client, each writing to a per-client memory subfolder. The same six-step process repeats every engagement, creating a productized delivery experience that the agency can scale and the client recognizes.

**The Pillar tools sharpen positioning.** The audio logo gives every team member the same 7-second answer to "what do you do." The methodology gives the agency a defensible, branded system to sell.

---

# What Students Walk Away With

Students of the AI Assisted Agency Accelerator install this plugin in Week 1. By Friday they have:

- A configured Agency OS with their voice, ICP, offer, and pricing
- Five personas operating as functional team members
- A daily and weekly rhythm
- The Sprint Framework ready for their first client
- An audio logo and signature methodology

And — this is the recursive payoff — **the productized service they can sell is the system they just built for themselves.** *"I install agentic operating systems for service businesses. Here's mine as proof."*

---

# Vocabulary Alignment

This plugin uses the same vocabulary students already know from Industry Rockstar and AAA 2.0:

- **MVV** (Mission, Vision, Values) — from CorePilot
- **Offer Stack** — from the Offer Stack Agent
- **8 Value Drivers** — from the framework of the same name
- **Automation Stack** — framed as automation, not just "tools"
- **Sprint Framework** — Blue Label's six-phase delivery methodology
- **Now-Next-Later** roadmap — the pilot-to-retainer artifact
- **Pilot** — the unit of delivery
- **Champion / User / Veto** — the stakeholder map
- **Audio logo** — Rockstar Pillar 1
- **Methodology** — the agency's branded signature framework
- **Retainer** — the ongoing engagement
- **Daily standup, Weekly review** — the operational rhythm

Every term in the plugin maps to a concept already taught across the curriculum. Nothing new to learn — just installable.

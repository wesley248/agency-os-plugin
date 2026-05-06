---
name: setup-agency-os
description: Bootstrap the Agency Operating System for a new student. Runs the five foundational interviews in order, writes outputs to memory/, and confirms the personas are ready. Use this skill when the user says "set up agency os", "bootstrap my agency", "let's start", "configure my OS", or runs /setup-agency-os for the first time.
---

# Setup: Agency Operating System

You are the orchestrator. Your job is to take a brand-new student from zero to a populated Agency OS in roughly 60-90 minutes, by running five interview skills in sequence and confirming each output.

## Two entry paths — let the student choose

When invoked, open with this:

> Welcome. There are two ways to set up your Agency OS:
>
> **Option A — Linear bootstrap (60-90 min).** I walk you through five interviews in order: MVV → ICP → Offer Stack → Value Drivers → Automation Audit. By the end your foundation is locked. Best if you're starting from scratch and want a structured walkthrough.
>
> **Option B — Assessment-driven (5 min then personalized).** I run a 12-question diagnostic to figure out where you actually are across all five OS layers, then build you a personalized roadmap. Best if you've already done some of this work elsewhere or you want the highest-leverage thing first instead of going in order.
>
> Which do you prefer — A or B?

If they pick **A**, continue with the linear sequence below.
If they pick **B**, invoke `/agency-roadmap` and stop — that skill takes over from there. After the assessment generates a roadmap, the user can come back to setup-agency-os if/when they want to do bootstrap interviews in linear order.

## Sequence (Option A — linear bootstrap)

Walk the student through these five interviews **in order**. Do not skip ahead — each one feeds the next.

1. **MVV** (≈20 min) → invoke skill `agency-mvv`
   Output: `memory/mvv.md`
   Mirrors CorePilot. Captures Mission, Vision, Values — voice signature for every persona.

2. **ICP** (≈15 min) → invoke skill `agency-icp`
   Output: `memory/icp.md`
   The exact buyer — title, pain, trigger, budget, watering holes.

3. **Offer Stack** (≈25 min) → invoke skill `agency-offer-stack`
   Output: `memory/offer-stack.md`
   Mirrors the Offer Stack Agent methodology: Problem Map → Offer Stack → Positioning.

4. **Value Drivers** (≈15 min) → invoke skill `agency-value-drivers`
   Output: `memory/value-drivers.md`
   Maps the agency against the 8 Value Drivers framework, derives pricing tiers.

5. **Automation Audit** (≈10 min) → invoke skill `agency-automation-audit`
   Output: `memory/automation-stack.md`
   What's automated, what's manual, where AI plugs in.

## Visual progress — the live dashboard

At any point during or after setup, the student can spawn a live Kanban dashboard of the entire Agency OS journey by saying:

- "create my roadmap"
- "show me the roadmap"
- "agency roadmap"
- "where am I in setup"

This routes to the `agency-roadmap` skill and renders a 7-stage pathway (Foundation → Positioning → Acquire → Engage → Deliver → Retain → Operate) with all 23 skills placed in their proper sequence. Cards lock until prerequisites are complete; the student can mark steps done as we go and watch the meter advance.

If they haven't seen it yet, mention it after the MVV interview — it gives them visual proof of forward motion early in what is otherwise a long session.

## Advanced (after bootstrap) — Sprint Framework

Once the bootstrap is done and the agency has its first client, point the student at the **Sprint Framework** — the Blue Label / AAA 2.0 delivery methodology. Six skills, used per-client-engagement (not bootstrap):

- `agency-strategic-alignment` — Phase 1 discovery
- `agency-process-map` — Phase 2 process mapping
- `agency-use-case-matrix` — Phase 2.5 AI opportunity scoring
- `agency-sprint-planner` — Phase 3 pilot design
- `agency-now-next-later` — Phase 5 phased roadmap
- `agency-retainer-architect` — Phase 6 transfer to retainer

Plus the Rockstar Pillar tools:
- `agency-audio-logo` — 7-second positioning hook (Pillar 1)
- `agency-methodology` — productize their branded signature methodology

Tell the student these exist. Don't run them in setup — they're for live engagement work.

## Opening

Open with this — adapt the tone to match the student:

> Welcome. Over the next hour or so, I'll interview you across five dimensions of your agency. By the end, your operating system will have everything it needs to run — every persona will answer in your voice, with your offer, for your clients.
>
> We'll do them one at a time. After each, I'll show you what got captured and you can refine it before we move on.
>
> Ready? Let's start with **Agency DNA** — who you are and what you build.

## Between interviews

After each interview skill completes:

1. Show the student the file that got written.
2. Ask: *"Does this match how you'd describe it? Anything to refine before we move on?"*
3. Update the file based on their feedback.
4. Confirm and proceed to the next interview.

## After all five

When all five files exist in `memory/`, confirm setup is complete:

> Your Agency OS is online. Five files now live in `memory/` — every persona reads from them.
>
> Try it: run `/agency-head-of-sales` and ask *"what should I work on this week?"* — they'll answer based on your ICP, your offer, and your value drivers.
>
> Next, you'll typically:
> - Run `/agency-daily-standup` tomorrow morning to see the rhythm
> - Run `/agency-sprint-proposal` against a real prospect
> - Run `/agency-content-engine` to see a week of content drafted in your voice
>
> When you sign your first client, the **Sprint Framework** unlocks: `/agency-strategic-alignment` → `/agency-process-map` → `/agency-use-case-matrix` → `/agency-sprint-planner` → `/agency-now-next-later` → `/agency-retainer-architect`. That's the AAA 2.0 / Blue Label delivery rhythm.

After confirming setup is complete, **invoke `/agency-roadmap`** to generate the student's persistent roadmap and tracker. From this point on, `/agency-roadmap` is their home base — they can run it anytime to see where they are, what's been done, and what to focus on next.

## Resumability

If `memory/mvv.md` (or any of the five) already exists when this skill is invoked, ask:

> I see your OS is partially configured. Do you want to:
> 1. Resume where you left off (next missing interview)
> 2. Refresh a specific section (re-run one interview)
> 3. Start fresh (back up old files, run all five again)

Default to option 1 unless the student requests otherwise.

## Important

- Do not invent answers for the student. The whole value of this OS is that it captures *their* truth, not a generic template.
- If the student is vague, ask one follow-up question. If still vague, write what they said and flag it as `[needs refinement]` in the output file.
- Keep the energy up. This is a 60-90 min session — break the monotony with brief reflections ("that's clearer than most agencies I see") and short transitions.

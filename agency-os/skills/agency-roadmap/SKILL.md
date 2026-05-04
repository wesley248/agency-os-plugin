---
name: agency-roadmap
description: The home base for the Agency OS — assessment, persistent tracker, and personalized roadmap. Run anytime to see where you are, what you've completed, what's outstanding, and what to focus on next. Doubles as the entry point for new users (assessment-driven) and the navigation tool for returning users (status check). Use when the user says "roadmap", "where am I", "what should I focus on", "what's next", "show progress", "I'm lost", "assess my OS", "agency status", "tracker", or invokes /agency-roadmap.
---

# Agency OS Roadmap

This is the **home base** of the Agency Operating System. It does three jobs:

1. **Assessment** — diagnoses where the agency is across all five layers
2. **Tracker** — maintains a persistent record of what's done, what's in flight, what's outstanding
3. **Navigator** — recommends the single highest-leverage next action and the longer-range roadmap

Every other skill in the OS feeds into the roadmap. Every time the user comes back here, the roadmap reflects current reality based on the actual contents of `memory/`.

## Mode detection

When invoked, first determine which mode to run:

| Trigger | Mode |
|---|---|
| `memory/roadmap.md` does not exist | **First-time assessment** — run the diagnostic, generate the roadmap |
| `memory/roadmap.md` exists, user invocation has no specific args | **Status check** — read roadmap, scan memory/, refresh state, show progress + next action |
| User explicitly says "re-assess", "refresh assessment", "redo the roadmap" | **Re-assess** — back up current roadmap, run diagnostic fresh, regenerate |
| User asks "what should I do right now" | **Quick answer** — read roadmap, return the single recommended action with one-line rationale |

## Mode 1 — First-time assessment

Open with this:

> Welcome to your Agency OS roadmap. I'm going to ask 12 quick diagnostic questions across the five layers of the OS. By the end, I'll know where you are, what's working, what's missing, and what to focus on next. About 5 minutes.
>
> Most questions are Yes / Roughly / Not yet. Be honest — there are no wrong answers, only useful ones. Ready?

Then ask these questions, one at a time:

### Foundation (5 questions)
1. **MVV** — Could you state your Mission, Vision, and Values in one clear sentence each, right now, that you'd be proud to publish? *(Yes / Roughly / Not yet)*
2. **ICP** — Could you pick your ideal client out of a 100-result Sales Navigator search? *(Yes / Roughly / Not yet)*
3. **Offer** — Do you have a productized offer with named inclusions and a published price? *(Yes / Roughly / Not yet)*
4. **Value drivers** — Do you know which 1–3 of the 8 Value Drivers your agency primarily serves for clients? *(Yes / Roughly / Don't know what value drivers are)*
5. **Automation stack** — Is your own tool stack documented and stable, or are you patching things together? *(Documented / Mostly / Chaotic)*

### Positioning (2 questions)
6. **Audio logo** — Do you have a 7-second answer to "what do you do" that lands at networking events? *(Yes / Roughly / Not yet)*
7. **Methodology** — Do you have a named, branded signature methodology you can sell? *(Yes / Working on it / Not yet)*

### Operations (4 questions)
8. **Pipeline** — Are you running a sales pipeline you trust? *(Yes / Roughly / Not yet)*
9. **Delivery** — Are you actively delivering for clients right now? *(Yes / 1-2 / None right now)*
10. **Content** — Are you publishing content consistently? *(Yes / On and off / Not yet)*
11. **Ops health** — Is your finance / contracts / inbox under control? *(Yes / Mostly / Drowning)*

### Engagement state (1 question)
12. **Active engagements** — How many active client engagements do you have, and where are most of them? *(open answer — capture verbatim)*

### Open question (1 final)
13. **Biggest blocker** — In your own words: what's the single biggest thing slowing your agency down right now? *(open answer — capture verbatim)*

After all 13 answers, **also scan `memory/`** to detect ground truth:

- For each foundation file (`mvv.md`, `icp.md`, `offer-stack.md`, `value-drivers.md`, `automation-stack.md`), check existence and last-updated date.
- For each pillar file (`audio-logo.md`, `methodology.md`), same.
- For per-client folders under `memory/clients/{slug}/`, count active engagements and identify their phase by which files exist (strategic-alignment.md → process-map.md → use-case-matrix.md → sprint-plan.md → now-next-later.md → retainer.md).

If the assessment answer says "Yes" but the memory file doesn't exist (or is empty), **flag the discrepancy** and ask: *"You said yes to X, but I don't see `memory/X.md`. Have you done that work somewhere else, or should we capture it now?"*

## Synthesis: generate the roadmap

Build `memory/roadmap.md` using the structure below. Use the assessment answers AND the actual state of memory files. Truth from memory wins over self-reported truth from the assessment.

```markdown
# Your Agency OS Roadmap

**First assessed:** YYYY-MM-DD
**Last updated:** YYYY-MM-DD

## Phase summary

| Layer | State | Top gap |
|---|---|---|
| Foundation | ✅ Complete / 🟡 Partial / ❌ Not started | ... |
| Positioning | ... | ... |
| Operations | ... | ... |
| Engagement | ... | ... |

## Foundation (Bootstrap interviews)
- ✅ / 🟡 / ❌ **MVV** — last updated YYYY-MM-DD (or: not yet)
- ✅ / 🟡 / ❌ **ICP** — ...
- ✅ / 🟡 / ❌ **Offer Stack** — ...
- ✅ / 🟡 / ❌ **Value Drivers** — ...
- ✅ / 🟡 / ❌ **Automation Audit** — ...

## Positioning (Pillar tools)
- ✅ / 🟡 / ❌ **Audio Logo** — ...
- ✅ / 🟡 / ❌ **Methodology** — ...

## Operations (Persona use)
- 🟢 / 🟡 / ⚪ **Head of Sales** — last invoked YYYY-MM-DD (if observable from outputs/)
- 🟢 / 🟡 / ⚪ **Head of Delivery**
- 🟢 / 🟡 / ⚪ **Head of Marketing**
- 🟢 / 🟡 / ⚪ **Head of Operations**
- 🟢 / 🟡 / ⚪ **Executive Assistant**

## Rhythms
- 🟢 / ⚪ **Daily standup** — last run YYYY-MM-DD
- 🟢 / ⚪ **Weekly review** — last run YYYY-MM-DD

## Active client engagements
| Client | Phase | Last activity | Next step |
|---|---|---|---|
| {client name} | {Phase 1-6} | YYYY-MM-DD | Run `/agency-{next-skill}` |

## Latest assessment snapshot
**Date:** YYYY-MM-DD
**Foundation:** _/5 complete
**Positioning:** _/2 complete
**Active engagements:** N
**Biggest blocker:** "{verbatim quote from Q13}"

## ⭐ Recommended next action
**Run `/agency-{skill}`** — {one-sentence rationale tied to their biggest blocker or biggest gap}

## Full roadmap (in priority order)
1. ...
2. ...
3. ...

## What's earned (later, not now)
- {item} — unlocks when {condition}
- {item} — unlocks after {prerequisite}

## Last-updated history
- YYYY-MM-DD — Initial assessment
- (later updates appended here)
```

## Mode 2 — Status check (return user)

When `memory/roadmap.md` exists and user just types `/agency-roadmap`:

1. **Read** `memory/roadmap.md`.
2. **Scan** all memory files and per-client folders to detect what's changed since last roadmap update.
3. **Update** the roadmap document in place — refresh statuses, last-updated dates, active engagement phases.
4. **Display** the refreshed roadmap to the user with the changes called out:

> Your roadmap is up to date as of {today}.
>
> **Since your last check-in:**
> - ✅ Completed `/agency-icp` ({date})
> - 🟢 Logged 2 new client comms in `memory/clients/acme/`
> - 🟡 `memory/value-drivers.md` is still outstanding
>
> **Right now, focus on:** {one specific recommended skill + 1-line rationale}

Append a new entry to the **Last-updated history** section.

## Mode 3 — Re-assess

When user explicitly asks to re-run the diagnostic:

1. Back up current roadmap to `memory/roadmap.md.bak.YYYY-MM-DD`.
2. Run the 13-question diagnostic again.
3. Regenerate `memory/roadmap.md` from scratch.
4. Confirm: *"Re-assessment complete. Old roadmap backed up. Anything you want to discuss about the new priorities before you continue?"*

## Mode 4 — Quick answer

When user asks "what should I do right now" / "what's next" / "next action":

1. Read `memory/roadmap.md`.
2. Quickly verify the **Recommended next action** is still valid (the skill it points at hasn't been run since roadmap was last updated).
3. Return one paragraph:

> Right now: **`/agency-{skill}`**.
> Why: {one sentence connecting their biggest blocker to this skill's output}.
> Time: ~{N} minutes.

That's it. No long-form reading required.

## Recommendation logic

Use these heuristics, in order, to pick the recommended next action:

1. **Foundation gaps come first.** If any of MVV / ICP / Offer Stack are missing, recommend the earliest missing one — none of the personas can operate without them.
2. **Active engagement gaps next.** If a client engagement exists and is in Phase N but the next-phase file is missing, recommend the next-phase skill.
3. **Operational pain points.** If their biggest blocker (Q13) maps to a specific persona or workflow, recommend that. Examples:
   - *"converting calls to proposals"* → `/agency-sprint-proposal` or sharpening `/agency-offer-stack`
   - *"finding clients"* → `/agency-head-of-marketing` or `/agency-content-engine`
   - *"too much in my inbox"* → `/agency-executive-assistant`
   - *"don't know what to charge"* → `/agency-value-drivers`
4. **Positioning sharpening.** If foundation is solid but they don't have an audio logo or methodology, recommend `/agency-audio-logo` next.
5. **Rhythm establishment.** If foundation is solid and they have at least one active engagement, recommend setting up `/agency-daily-standup` as a daily habit.

Always pick **one** recommended action. Don't dump a list — that's what the full roadmap is for.

## What gets included in the roadmap

The roadmap tracks every meaningful capability of the OS:

- **Bootstrap files** — completion status, last-updated date, freshness flag (>90 days = stale)
- **Pillar files** — same
- **Persona usage** — inferred from `outputs/` if you write outputs there, or asked of the user
- **Rhythm cadence** — last run dates, frequency
- **Active engagements** — by client, by Sprint phase
- **Methodology evolution** — version, when last refined
- **Open lessons** — count of recent entries in `memory/lessons.md`

## Boundaries

- **Don't fabricate completion.** If the user says "yes I have an MVV" but `memory/mvv.md` is empty, surface the discrepancy. Don't write to the file — that's the MVV skill's job.
- **Don't invent recommendations.** Always tie the recommended next action to either (a) a real gap detected in memory, or (b) the user's verbatim biggest-blocker answer.
- **Always offer the "linear bootstrap" alternative** for users who feel overwhelmed by the assessment. They can run `/setup-agency-os` for a structured walkthrough instead.
- **Never run other skills automatically.** Recommend, don't auto-fire. The user invokes the next skill themselves.
- **Memory is sacred.** This skill writes only to `memory/roadmap.md` (and its backups). Never touches other memory files.

## After every invocation

Always end with one line that orients the user:

> Run `/agency-roadmap` anytime to come back here. This is your home base.

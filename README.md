# Agency OS Plugin

An installable Claude Code plugin that bootstraps an **Agency Operating System** for service businesses — interview-driven, persona-based, paerclip-style.

Built around the methodologies students already know from **Industry Rockstar** and the **AI Assisted Agency Accelerator** — CorePilot MVV, the Offer Stack, the 8 Value Drivers, and the Blue Label Sprint Framework.

Students install this in Week 1 of the Agency Accelerator. ~90 minutes of guided interviews populate the `memory/` folder. From that point on, every persona (Head of Sales, Head of Delivery, etc.) speaks in *their* voice, knows *their* offer, *their* clients, *their* tools.

## How it works

```
1. Install the plugin
2. Run /setup-agency-os
   → orchestrates the 5 bootstrap interviews
   → writes memory/mvv.md, memory/icp.md, memory/offer-stack.md,
     memory/value-drivers.md, memory/automation-stack.md
3. Personas come online
   → /agency-head-of-sales, /agency-head-of-delivery, /agency-head-of-marketing,
     /agency-head-of-operations, /agency-executive-assistant
4. Workflows + rhythms
   → /agency-daily-standup, /agency-weekly-review
   → /agency-sprint-proposal, /agency-strategic-alignment, /agency-content-engine
5. (Advanced) Sprint Framework — when you sign your first client
   → /agency-strategic-alignment → /agency-process-map → /agency-use-case-matrix
   → /agency-sprint-planner → /agency-now-next-later → /agency-retainer-architect
```

All skills are namespaced with `agency-` (except the orchestrator) to avoid collisions with other plugins (e.g. AI District's `corepilot-mvv`, `head-of-sales`, `offer-stack-agent`).

## Architecture

### Home base — `/agency-roadmap`

The skill students return to whenever they feel lost. Run it to:

- Take a 12-question assessment that produces a personalized roadmap
- See progress across every layer (foundation, positioning, operations, engagement)
- Get the single recommended next action
- Track active client engagements and their current Sprint phase

Two entry paths into the OS — `/setup-agency-os` for a structured linear bootstrap, or `/agency-roadmap` for assessment-driven navigation. Either path leads to the same place: a fully configured OS with personas, rhythms, and a Sprint Framework ready for clients.

### Layer 1 — Bootstrap Interviews (5 skills, run once)

Mirrors the methodologies students already know:

| Skill | Output | Methodology source |
|---|---|---|
| `agency-mvv` | `memory/mvv.md` | **CorePilot** — Mission, Vision, Values |
| `agency-icp` | `memory/icp.md` | ICP — buyer, pain, trigger, budget, watering holes |
| `agency-offer-stack` | `memory/offer-stack.md` | **Offer Stack Agent** — Problem Map → Offer Stack → Positioning |
| `agency-value-drivers` | `memory/value-drivers.md` | **8 Value Drivers** framework + pricing ladder |
| `agency-automation-audit` | `memory/automation-stack.md` | Automation stack inventory |

### Layer 2 — Personas (5 skills, read memory + adopt role)

- `agency-head-of-sales` — pipeline, qualification, proposal triage
- `agency-head-of-delivery` — client work, project plans, status updates
- `agency-head-of-marketing` — content engine, LinkedIn, lead magnets
- `agency-head-of-operations` — invoicing, contracts, admin
- `agency-executive-assistant` — inbox, scheduling, follow-ups

### Layer 3 — Rhythms & Workflows (6 skills, ongoing)

- `agency-daily-standup` — morning pull from each persona
- `agency-weekly-review` — Friday retro across all personas
- `agency-sprint-proposal` — branded sprint proposal from offer + ICP
- `agency-content-engine` — week of content from MVV + ICP + offer
- `agency-meeting-transcript-processor` — Fathom transcripts → memory updates
- `agency-strategic-alignment` (also Layer 4 — see below)

### Layer 4 — Sprint Framework (advanced — per-client engagement)

The Blue Label / AAA 2.0 delivery methodology, six phases per engagement:

| Skill | Phase | Mirrors |
|---|---|---|
| `agency-strategic-alignment` | 1 — Discovery | The 4 Strategic Alignment Questions |
| `agency-process-map` | 2 — Process Mapping | End-to-end workflow capture |
| `agency-use-case-matrix` | 2.5 — Pilot selection | AI opportunity scoring matrix |
| `agency-sprint-planner` | 3 — Sprint design | 2-week pilot plan with daily milestones |
| (Phase 4 = build, no skill required — execute the plan) | | |
| `agency-now-next-later` | 5 — Roadmap | The phased upsell artifact |
| `agency-retainer-architect` | 6 — Transfer | Pilot → ongoing retainer conversion |

### Layer 5 — Pillar Tools (Rockstar Advisor positioning)

- `agency-audio-logo` — 7-second positioning hook (Rockstar Pillar 1)
- `agency-methodology` — design the agency's branded signature framework

## Install

Two paths. **GitHub install is preferred** — auto-updates land in students' sessions whenever the plugin is patched. Zip path is the offline fallback.

### Path A — GitHub install (recommended for students)

In Claude Code, run these three commands once:

```
/plugin marketplace add wesley248/agency-os-plugin
/plugin install agency-os@agency-os-plugin
/plugin
```

In the third command, navigate to **Marketplaces → agency-os-plugin → Enable auto-update**.

After that, `git push` to the repo equals automatic updates for every student at next session start. Click `/reload-plugins` when prompted.

### Path B — Zip install (offline / no GitHub)

```bash
# 1. Unzip agency-os-plugin.zip somewhere on your machine
# 2. Run the install script
bash install.sh
# 3. In Claude Code, run:
#    /plugin install agency-os@local-desktop-app-uploads
```

The script drops the plugin into Claude Code's local marketplace at
`~/.claude/plugins/marketplaces/local-desktop-app-uploads/agency-os/` and
auto-registers it in the marketplace manifest. You handle the `/plugin install`
step yourself because settings.json edits need explicit user approval.

Updates with this path require re-running the script with a new zip.

### Path C — Live development (Wesley only)

```bash
ln -s ~/Desktop/agency-os-plugin ~/.claude/plugins/marketplaces/local-desktop-app-uploads/agency-os
```

Plus the marketplace.json + `/plugin install` registration. Edits to skills are picked up on the next Claude Code session restart.

## Curriculum mapping

| Session | Skills introduced | Outcome |
|---|---|---|
| Pre-work | (install) | Plugin installed, Claude verified |
| Week 1 Tue | `setup-agency-os`, `agency-mvv`, `agency-icp`, `agency-offer-stack` | Three of the five bootstrap files populated; first persona answers in voice |
| Week 1 Fri | `agency-value-drivers`, `agency-automation-audit`, `agency-audio-logo`, `agency-methodology` | Bootstrap complete; signature methodology + audio logo locked |
| Week 2 | Vibe-code the client-facing layer | Productized service ready to sell |
| Post-training (live engagement) | Sprint Framework — `strategic-alignment` → `retainer-architect` | First client engagement runs through the OS |

## What students sell after

The service they install for clients **is the system they just built for themselves.** *"I install agentic operating systems for service businesses — here's mine as proof."*

## Vocabulary alignment

This plugin is intentionally aligned to vocabulary already in use across IR and AAA 2.0:

| Concept | Term in plugin | Sourced from |
|---|---|---|
| Foundational identity work | **MVV** (not "DNA") | CorePilot |
| Productized service design | **Offer Stack** (not "offer architecture") | Offer Stack Agent |
| Departmental positioning | **8 Value Drivers** | 8 Value Drivers framework |
| Tool/automation inventory | **Automation Stack** (not "tool stack") | AAA 2.0 transcripts |
| Per-client delivery | **Sprint Framework** (Blue Label phases 1-6) | AAA 2.0 Bootcamp #1 |
| Pilot artifact | **Now-Next-Later** roadmap | AAA 2.0 |
| Positioning hook | **Audio logo** (7-second) | Rockstar Pillar 1 |
| Signature framework | **Methodology** (branded, visualized) | Rockstar Advisor |
| Ongoing engagement | **Retainer** | AAA 2.0 / Rockstar |

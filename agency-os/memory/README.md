# Memory

This folder is the **strategic foundation of the agency**. Every persona reads from these files on every invocation. Treat it as the single source of truth.

## Home base — the live dashboard

The Agency OS home base is a **live Kanban dashboard** spawned by the `agency-roadmap` skill, not a markdown file. Say *"create my roadmap"* (or any of the trigger phrases in the skill) and a 7-stage pathway opens as a Cowork artifact. Click cards to launch their slash commands. Mark cards done as you go. Progress persists in localStorage on the student's machine — no memory file is written.

The canonical dashboard lives at `agency-os/dashboards/agency-os-pathway.html` (and is bundled into the skill folder for offline launch). The regeneration prompt lives at `prompts/create-agency-roadmap.md` at the repo root.

## Bootstrap files (written by the 5 interview skills)

| File | Written by | Read by |
|---|---|---|
| `mvv.md` | `agency-mvv` (CorePilot methodology) | All personas (mandatory voice + values match) |
| `icp.md` | `agency-icp` | Sales, Marketing, EA, Content Engine |
| `offer-stack.md` | `agency-offer-stack` (Offer Stack methodology) | Sales, Delivery, Operations, Sprint Proposal, Onboarding |
| `value-drivers.md` | `agency-value-drivers` (8 Value Drivers framework) | Sales, Marketing, Delivery |
| `automation-stack.md` | `agency-automation-audit` | Operations, EA, Onboarding |
| `lessons.md` | `agency-weekly-review` (append-only) | All personas |

## Advanced / optional files

| File | Written by | Purpose |
|---|---|---|
| `audio-logo.md` | `agency-audio-logo` (Rockstar Pillar 1) | The 7-second positioning hook |
| `methodology.md` | `agency-methodology` | The agency's branded signature framework |

## Per-client engagement files

When the agency runs a client engagement through the Sprint Framework, each client gets a folder under `memory/clients/{client-slug}/`:

| File | Written by | Sprint Framework phase |
|---|---|---|
| `strategic-alignment.md` | `agency-strategic-alignment` | Phase 1 |
| `process-map.md` | `agency-process-map` | Phase 2 |
| `use-case-matrix.md` | `agency-use-case-matrix` | Phase 2.5 |
| `sprint-plan.md` | `agency-sprint-planner` | Phase 3 |
| `now-next-later.md` | `agency-now-next-later` | Phase 5 |
| `retainer.md` | `agency-retainer-architect` | Phase 6 |

## Editing rules

1. **Skills write here, not the user directly** — though manual edits are fine, prefer re-running the relevant interview to keep things consistent.
2. **Personas read here, never write** — they propose updates via `agency-meeting-transcript-processor` and the user approves.
3. **Append-only for `lessons.md`** — historical insight is value; never overwrite.
4. **Versioning** — every file has a `Last updated:` line at the top; bump it on every change.
5. **Per-client privacy** — `memory/clients/` may contain sensitive client data. Treat each subfolder as need-to-know.

## When to refresh

- **Quarterly** — re-run `agency-mvv` to catch voice/vision drift
- **After 5+ deals lost** — re-run `agency-icp` (the ICP is probably wrong)
- **After a price test** — re-run `agency-offer-stack` and `agency-value-drivers`
- **Whenever you change a tool** — re-run `agency-automation-audit`
- **After every signed engagement** — refresh `agency-methodology` if you've added a phase

## Privacy

This folder may contain sensitive business data — pricing, client lists, financial reality, client-side metrics. Don't sync to public repos. Don't paste into shared documents. The plugin assumes this lives locally on the founder's machine.

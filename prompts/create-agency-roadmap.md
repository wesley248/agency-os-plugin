# Agency OS Roadmap — Generation Prompt

Paste this prompt into a fresh Claude conversation (in Cowork mode, or any agent that can write HTML files and register Cowork artifacts) to recreate the Agency OS pathway dashboard from scratch. Self-contained — no memory files, no prior context required.

---

## PROMPT — copy everything between the `==BEGIN==` and `==END==` markers

==BEGIN==

Build me a single-file HTML artifact called the **Agency OS Pathway Dashboard**. It's a horizontally-scrolling Kanban view that maps every skill in the Agency OS plugin to its place in the agency-building journey, with status, dependencies, and click-to-launch behavior. Visual style modeled on Cofounder.co's "How to Build a Company" pathway view.

### What to produce

A complete `agency-os-pathway.html` file, then register it as a Cowork artifact with id `agency-os-setup-progress`. The HTML must be self-contained — inline all CSS and JS, no external dependencies, light mode.

### Layout

- **App shell:** rounded card on a cream `#f7f5f0` background with a subtle dot grid (`radial-gradient(circle, rgba(0,0,0,0.05) 1px, transparent 1px)` at `18px` size).
- **Header bar:** folder icon (blue gradient), title "How to build your agency", subtitle "Agency OS · Operating system pathway", reset button on the right.
- **Meter strip:** progress count ("X of 23 complete"), progress bar, legend showing the four kinds (your input / agent runs / persona / done).
- **Kanban area:** horizontal scroll containing 7 stage columns side-by-side, each `280px` wide with `28px` gap.

### The seven stages and 23 cards

Use exactly this data structure. Each card has: `id`, `title`, `icon` (one of the icon keys below), `cmd` (slash command), `kind` (`input` | `agent` | `persona`), `deps` (array of card ids that must be complete first).

**Stage 1 · Foundation**
1. `mvv` — Mission, vision, values · icon `compass` · cmd `/agency-mvv` · kind `input` · deps `[]`
2. `icp` — Ideal client profile · icon `user` · cmd `/agency-icp` · kind `input` · deps `[mvv]`
3. `offer` — Offer stack · icon `layers` · cmd `/agency-offer-stack` · kind `input` · deps `[mvv, icp]`
4. `value-drivers` — Value drivers · icon `bars` · cmd `/agency-value-drivers` · kind `input` · deps `[offer]`
5. `automation` — Automation audit · icon `bolt` · cmd `/agency-automation-audit` · kind `input` · deps `[mvv]`

**Stage 2 · Positioning**
6. `audio-logo` — Audio logo · icon `mic` · cmd `/agency-audio-logo` · kind `input` · deps `[mvv, icp, offer]`
7. `methodology` — Signature methodology · icon `framework` · cmd `/agency-methodology` · kind `input` · deps `[mvv, offer, value-drivers]`

**Stage 3 · Acquire**
8. `head-of-marketing` — Head of marketing · icon `megaphone` · cmd `/agency-head-of-marketing` · kind `persona` · deps `[mvv, icp, offer, audio-logo]`
9. `content-engine` — Content engine · icon `pen` · cmd `/agency-content-engine` · kind `agent` · deps `[mvv, icp, offer]`
10. `head-of-sales` — Head of sales · icon `handshake` · cmd `/agency-head-of-sales` · kind `persona` · deps `[icp, offer, value-drivers]`
11. `sprint-proposal` — Sprint proposal · icon `doc` · cmd `/agency-sprint-proposal` · kind `agent` · deps `[offer, value-drivers]`

**Stage 4 · Engage**
12. `strategic-alignment` — Strategic alignment · icon `target` · cmd `/agency-strategic-alignment` · kind `input` · deps `[head-of-sales]`
13. `process-map` — Process map · icon `flow` · cmd `/agency-process-map` · kind `input` · deps `[strategic-alignment]`
14. `use-case-matrix` — Use case matrix · icon `matrix` · cmd `/agency-use-case-matrix` · kind `agent` · deps `[process-map]`

**Stage 5 · Deliver**
15. `sprint-planner` — Sprint planner · icon `sprint` · cmd `/agency-sprint-planner` · kind `input` · deps `[use-case-matrix]`
16. `head-of-delivery` — Head of delivery · icon `ship` · cmd `/agency-head-of-delivery` · kind `persona` · deps `[sprint-planner]`
17. `nnl` — Now / next / later · icon `road` · cmd `/agency-now-next-later` · kind `input` · deps `[sprint-planner]`

**Stage 6 · Retain**
18. `retainer-architect` — Retainer architect · icon `loop` · cmd `/agency-retainer-architect` · kind `input` · deps `[nnl]`

**Stage 7 · Operate**
19. `daily-standup` — Daily standup · icon `sun` · cmd `/agency-daily-standup` · kind `agent` · deps `[mvv, icp, offer]`
20. `weekly-review` — Weekly review · icon `cal` · cmd `/agency-weekly-review` · kind `agent` · deps `[mvv, icp, offer]`
21. `ea` — Executive assistant · icon `inbox` · cmd `/agency-executive-assistant` · kind `persona` · deps `[mvv]`
22. `head-of-ops` — Head of operations · icon `cog` · cmd `/agency-head-of-operations` · kind `persona` · deps `[mvv, offer]`
23. `transcript` — Transcript processor · icon `transcript` · cmd `/agency-meeting-transcript-processor` · kind `agent` · deps `[mvv, icp]`

### Card visual

Each card is a white rounded rectangle (`12px` radius, `1px` light border, very light shadow `0 1px 3px rgba(0,0,0,0.05)`) with:

- **30×30 icon tile** on the left (light beige `#f5f3ee` background, `7px` radius, monochrome `currentColor` SVG icon at `16×16`).
- **Title** at `13px` weight `500`.
- **Subtitle** at `11px` muted gray with a small colored dot prefix matching the kind (orange for `input`, blue for `agent`, purple for `persona`).
- **Status corner indicator** — top right, depends on state (see below).

Card states:

- **Available** — full opacity, blue "Available" pill (`-8px` top, `12px` right, light blue background `#dbeafe` with text `#1d4ed8`, `9px` text uppercase tracking-wide).
- **In progress** — amber pill "In progress" in the same position (`#fef3c7` / `#b45309`).
- **Locked** — opacity `0.55`, lock icon top-right (gray), subtitle replaced with "Needs earlier steps first" and the dot turned gray.
- **Complete** — green check circle top-right (`#16a34a` background, white check), card background tinted soft green `#f6fbf7`, border `rgba(22,163,74,0.18)`.

Stage column header: a rounded pill with `10px` uppercase letterspaced label like "STAGE 1 · FOUNDATION", with a `mono` counter on the right showing "X/N" (done over total).

### Behavior

- **Click any card** — if locked, show a toast saying which dependency is blocking it. Otherwise: try `window.sendPrompt(cmd)` → fall back to `window.cowork.sendPrompt(cmd)` → fall back to `navigator.clipboard.writeText(cmd)` with a toast saying "Copied {cmd} — paste in chat to run". After firing, mark the card as `in-progress` if it isn't already complete.
- **Hover any non-locked card** — reveal a small "Mark done" / "Mark not done" link in the bottom-right corner. Click it (and stop propagation so the parent card doesn't also fire) to toggle the card's complete status.
- **Reset button (header)** — confirms then clears localStorage. Memory files on disk are not touched.
- **Persistence** — store the progress map in `localStorage` under key `agency-os-pathway-v2` as `{ [cardId]: 'complete' | 'in-progress' }`. Render from this on every page load.
- **Toast** — fixed-position black pill at the bottom center, fades in for ~2 seconds when triggered.

### Dependencies

A card is `complete` if its id is `'complete'` in localStorage. A card is `locked` if any of its deps are not complete. Otherwise it's `in-progress` (if the user has clicked it) or `available`. Re-render the entire kanban whenever progress changes so dependent cards unlock automatically.

### Icons

Inline SVG library, all using `currentColor` with `1.5px` stroke, fitting in a `16×16` viewBox: `compass`, `user`, `layers`, `bars`, `bolt`, `mic`, `framework`, `megaphone`, `pen`, `handshake`, `doc`, `target`, `flow`, `matrix`, `sprint`, `ship`, `road`, `loop`, `sun`, `cal`, `inbox`, `cog`, `transcript`. Pick simple line-icon shapes — circles, paths, rectangles. Don't pull from any icon library.

### Constraints

- Single HTML file, inline CSS and JS, no `<!DOCTYPE>` is fine but include `:root { color-scheme: light }`.
- No external libraries (no Chart.js, no Tailwind CDN, no fonts beyond the system stack).
- No emoji in the UI.
- All text in sentence case.
- Light mode only — no dark mode handling needed.
- Font stack: `-apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif`.

### Final step

After writing the HTML to a file, register it as a Cowork artifact:

- `id`: `agency-os-setup-progress`
- `description`: "Live pathway tracker for the Agency Operating System. Kanban layout across 7 stages — Foundation, Positioning, Acquire, Engage, Deliver, Retain, Operate. 23 cards mapping every Agency OS skill to its place in the journey. Dependencies enforce order; cards unlock as predecessors complete. Click a card to launch its slash command. Hover a card to reveal the manual complete toggle. Progress persists in localStorage."

Then tell the user the dashboard is open and orient them to the first card in Stage 1.

==END==

---

## How to use this prompt

**Direct chat (any Claude with file write + Cowork artifact tools):**
Paste the block above and the agent builds and registers the dashboard.

**Inside this Agency OS instance:**
Just say *"create my roadmap"* — the `agency-roadmap` skill is the runtime version of this prompt and triggers the same flow with two words.

**Sharing with another agency founder:**
Send them this whole file. They paste it into a fresh Cowork session and get an identical dashboard scoped to their own progress (localStorage is per-machine).

**Versioning:**
The prompt is a frozen spec — if you change the dashboard (add a stage, swap an icon, rename a card), update this file alongside `dashboards/agency-os-pathway.html` and `skills/agency-roadmap/pathway.html`. Three places, one source of truth.

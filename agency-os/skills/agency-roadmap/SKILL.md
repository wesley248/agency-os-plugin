---
name: agency-roadmap
description: Spawns the Agency OS pathway dashboard — a Kanban-style live artifact showing every skill in the operating system across 7 stages (Foundation → Positioning → Acquire → Engage → Deliver → Retain → Operate). Cards show status (Available, In progress, Locked, Complete), card type (your input / agent runs / persona), and dependencies. Clicking a card launches its slash command. State persists in localStorage. Use when the user says "create my roadmap", "show me the roadmap", "agency roadmap", "build my dashboard", "show my pathway", "where am I in setup", "open the kanban", or "spawn the dashboard".
---

# Agency Roadmap

Your job is to spawn the Agency OS pathway dashboard as a live Cowork artifact. This is a one-shot operation — read, write, register, done.

## Steps

1. **Read** the bundled `pathway.html` in this skill's folder.
2. **Write** it to the user's outputs directory at `agency-os-pathway.html`.
3. **Check** if an artifact with id `agency-os-setup-progress` already exists by calling `mcp__cowork__list_artifacts`.
   - If it exists, call `mcp__cowork__update_artifact` with that id and the new HTML path.
   - If it does not exist, call `mcp__cowork__create_artifact` with id `agency-os-setup-progress`.
4. **Tell the user** the dashboard is open and explain (briefly) what they're looking at:
   - 7 stages, 23 cards
   - Click a card to launch its slash command
   - Hover a card → "Mark done" toggle appears in the corner
   - Locked cards tell you which step is blocking them

## Description for the artifact

Use this for both create and update:

> Live pathway tracker for the Agency Operating System. Kanban layout across 7 stages — Foundation, Positioning, Acquire, Engage, Deliver, Retain, Operate. 23 cards mapping every Agency OS skill to its place in the journey. Dependencies enforce order; cards unlock as predecessors complete. Click a card to launch its slash command. Hover a card to reveal the manual complete toggle. Progress persists in localStorage.

## Update summary (when updating, not creating)

> Refreshed the Agency OS pathway dashboard from the latest source.

## Tone

Don't over-explain. The dashboard speaks for itself once it opens. Two or three lines of orientation is enough — point them at the first available card and let them go.

## Source of truth

The canonical `pathway.html` lives in the user's GitHub repo at `dashboards/agency-os-pathway.html`. The copy in this skill folder is the bundled fallback. Keep them in sync — when you update the dashboard, update both.

## Do not

- Do not modify `memory/` files — this skill is purely visual.
- Do not run any of the bootstrap interviews from inside this skill — it's a launcher, not an orchestrator.
- Do not ask the user clarifying questions before spawning. Just spawn it.

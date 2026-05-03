---
name: agency-automation-audit
description: Quick audit of the agency's existing automation and tool stack — what's automated, what's manual, where AI could plug in. Frames the conversation around automation, not just tools. Writes to memory/automation-stack.md. Use when the user says "automation audit", "tool audit", "what's in my stack", "automation stack", or is invoked by setup-agency-os.
---

# Automation Stack Audit

The lightest of the bootstrap interviews — 10 minutes max. The point: capture what's already automated, what's still manual, and where AI could plug in. Personas read this so they don't recommend tools the agency already has (or worse, conflict with them).

## Goal

Produce `memory/automation-stack.md` capturing the agency's current stack across the **agency's own operations** — not their clients' stacks. Categories:

- **CRM / Pipeline** — HubSpot, Pipedrive, Notion, spreadsheet?
- **Email** — Gmail, Outlook?
- **Calendar** — Google, Outlook?
- **Internal comms** — Slack, Teams?
- **External comms** — WhatsApp, Telegram, email-only, Loom?
- **Project / task management** — Notion, ClickUp, Linear, Asana?
- **Docs / wiki** — Notion, Google Drive, Coda?
- **Automation glue** — Zapier, n8n, Make.com, none?
- **AI tools** — Claude, ChatGPT, Gemini, Cursor, others?
- **Accounting / invoicing** — Xero, QuickBooks, Stripe, ThriveCart?
- **Calls / meetings** — Zoom, Google Meet, Riverside?
- **Recording / transcription** — Fathom, Otter, Granola, Read.ai?
- **Custom GPTs / Claude Projects** — what's already built?

## Method

Run through the categories in one pass. For each:
- *"What do you use for X — or is it nothing yet?"*
- *"Is that automated, or are you still doing it manually?"*

Don't moralize. If they're using a spreadsheet for CRM, capture that — don't pitch HubSpot. The point of this file is **truth, not aspiration**.

After the run-through, three quick questions:

1. **Where do you spend the most manual time per week?** (the AI-ification candidate)
2. **What's broken or partially-broken?** (the fix-first candidate)
3. **What do clients see vs. what's internal?** (the brand-touchpoint inventory)

## Output

```markdown
# Automation Stack

**Last updated:** YYYY-MM-DD

## Current stack

| Category | Tool | Automated? | Notes |
|---|---|---|---|
| CRM | ... | ✅ / 🟡 / ❌ | ... |
| Email | ... | ... | ... |
| Calendar | ... | ... | ... |
| Internal comms | ... | ... | ... |
| External comms | ... | ... | ... |
| Project mgmt | ... | ... | ... |
| Docs / wiki | ... | ... | ... |
| Automation glue | ... | ... | ... |
| AI tools | Claude (this OS) + ... | ... | ... |
| Accounting | ... | ... | ... |
| Meetings | ... | ... | ... |
| Transcription | ... | ... | ... |
| Custom GPTs / Projects | ... | ... | ... |

## Manual hotspots (AI-ification candidates)
1. ...
2. ...
3. ...

## What's broken or fragile
- ...

## Brand touchpoints (client-visible)
- ...

## Gaps (no tool yet)
- ...

## MCP integrations available
{list which of the above have a Claude MCP — Slack, Gmail, Calendar, Notion, Linear, etc.}
```

## After writing

> Bootstrap complete. Five files in memory/. Personas are online.
>
> Try it: run `/agency-head-of-sales` and ask *"what should I work on this week?"* — they'll answer in your voice, with your offer, for your ICP, against your driver positioning.

# Agency OS — MCP Server

Same skills, same memory, **different protocol**. This MCP server exposes everything the agency-os plugin does — but via MCP (Model Context Protocol), so the experience can be compared side-by-side against the plugin install path.

## What you get

| Plugin (skills) | MCP server (this) |
|---|---|
| 25 skills auto-trigger when Claude detects intent | Same 25 skills, exposed as MCP **prompts** invoked by name |
| Memory files written by skills, read by personas | Memory files exposed as **resources** + **tools** for read/write |
| Works in Claude Code only | Works in **Claude Desktop, claude.ai, AND Claude Code** |
| Slash command surface (`/agency-mvv`) | Prompt picker surface (Claude Desktop's `+` menu, or `@agency-os` in chat) |
| No external auth needed | No external auth — runs as stdio child process |

The server reads SKILL.md files from `../agency-os/skills/` at startup. **Edit a skill, restart the server, see the change.** No code changes needed for skill updates.

## What's intentionally different (so you can compare)

The biggest UX delta to feel during testing:

- **Plugin auto-triggers.** Type *"help me define my mission"* and Claude fires `agency-mvv`.
- **MCP prompts don't auto-trigger.** Type the same thing and Claude answers in plain chat. To use the MCP version, you have to explicitly invoke the prompt by name (`@agency-os` in Claude Desktop, or use the prompt picker).

That's the core architectural difference. The skills are identical bytes — what changes is *how Claude finds them*.

## Install

### 1. Set up Python environment

The `mcp` SDK requires Python 3.10+. The cleanest path on macOS is via `uv`:

```bash
cd ~/Desktop/agency-os-plugin/mcp-server
uv venv --python 3.13 .venv
uv pip install --python .venv/bin/python -r requirements.txt
```

If you don't have `uv` (`brew install uv`), the slower fallback is:

```bash
brew install python@3.13
cd ~/Desktop/agency-os-plugin/mcp-server
/opt/homebrew/bin/python3.13 -m venv .venv
.venv/bin/pip install -r requirements.txt
```

Either creates a virtualenv at `.venv/` and installs the `mcp` SDK.

### 2. Verify the server starts

```bash
.venv/bin/python server.py
```

It should print nothing and wait — that's correct, MCP servers communicate over stdio. **Ctrl-C to stop.**

If you get errors about missing `agency-os/` folder, check the server is at `~/Desktop/agency-os-plugin/mcp-server/` (sibling of `agency-os/`).

### 3. Configure Claude Desktop

Edit `~/Library/Application Support/Claude/claude_desktop_config.json` (create if missing):

```json
{
  "mcpServers": {
    "agency-os": {
      "command": "/Users/wesleylongueira/Desktop/agency-os-plugin/mcp-server/.venv/bin/python",
      "args": [
        "/Users/wesleylongueira/Desktop/agency-os-plugin/mcp-server/server.py"
      ]
    }
  }
}
```

If you already have other MCP servers configured, merge into the existing `mcpServers` block.

**Restart Claude Desktop.** Open a new conversation. You should see `agency-os` listed under available tools/prompts (look for the `+` menu or paperclip icon).

### 4. (Optional) Configure Claude Code

Add to your project's `.mcp.json` or to `~/.claude/claude_code_config.json`:

```json
{
  "mcpServers": {
    "agency-os": {
      "command": "/Users/wesleylongueira/Desktop/agency-os-plugin/mcp-server/.venv/bin/python",
      "args": [
        "/Users/wesleylongueira/Desktop/agency-os-plugin/mcp-server/server.py"
      ]
    }
  }
}
```

Restart Claude Code. The MCP tools will appear alongside your installed plugins — `mcp__agency-os__memory_read`, etc.

## Try it

Once connected, in **Claude Desktop**:

1. Click the `+` (or attachments icon) in a new conversation
2. You should see `agency-os` server with a list of prompts (one per skill)
3. Pick `agency-mvv` from the list — Claude loads the skill body and starts the MVV interview
4. The skill writes to `agency-os/memory/mvv.md` via the `memory_write` tool

In **Claude Code** (with both plugin and MCP installed):

1. `/agency-mvv` invokes the **plugin** version (auto-triggered skill)
2. Asking Claude *"use the agency-os MCP to run the MVV prompt"* invokes the **MCP** version
3. Both write to the same `agency-os/memory/mvv.md` file (same disk path)
4. Compare the experience — speed, feel, latency, how naturally Claude switches into the persona

## What to compare

When you test, watch for:

- **Discovery** — does Claude pick the right skill on the first try (plugin) vs. do you have to remember to invoke a prompt by name (MCP)?
- **Persona depth** — does Claude *become* the Head of Sales (plugin), or just read the persona description and answer normally (MCP)?
- **Memory continuity** — does Claude remember to read `mvv.md` before answering as a persona (plugin's "read on every invocation" pattern, vs. MCP's per-call tool invocation)?
- **Latency** — plugins load instantly, MCP has stdio round-trip overhead per tool call
- **Cross-surface** — try the MCP in Claude Desktop and in claude.ai. Plugins only work in Claude Code, so the MCP wins here

## Architecture notes

- **Stdio transport** — server runs as a child process of Claude. No HTTP, no auth, no network.
- **Stateless** — server reads files from disk on every request. No in-memory cache (so skill edits land instantly on restart).
- **File-system memory** — same memory directory as the plugin. Both can coexist; both write to the same files.
- **Prompts ≠ skills** — MCP prompts are just templates. The auto-trigger behavior of skills is a Claude-Code-specific feature that can't be replicated through MCP alone.

## Limitations vs. the plugin

- ❌ No auto-trigger on description match
- ❌ No native slash-command surface (you invoke prompts via menu or `@server-name`)
- ❌ Persona-becomes-skill UX is weaker — Claude reads the prompt body but doesn't always sustain the persona across follow-ups the way a skill does
- ✅ Works on Claude Desktop / claude.ai / Claude Code (plugin is Claude Code only)
- ✅ Easier to extend with live tools (Slack post, CRM update, etc.) — those are MCP-native

## Next steps if MCP wins the comparison

If the MCP UX feels good enough to ship:

1. **Add live tool integrations** — `mcp.tool()` for Slack post, Gmail draft, calendar create, CRM update. The plugin can't do these.
2. **Add scheduled tasks** — daily standup as a cron, weekly review on Fridays.
3. **Add multi-tenant memory** — server-side storage with per-student namespaces, real cross-session persistence.
4. **Host it** — instead of stdio, deploy as HTTP MCP so students don't need Python locally.

If the plugin UX wins (which is likely), the MCP is still useful as the *plumbing layer* for things the plugin can't do — the hybrid Option B from earlier.

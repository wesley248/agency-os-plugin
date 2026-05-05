"""Agency OS — MCP server.

Exposes the same skills and memory as the agency-os Claude Code plugin,
but through the MCP protocol so the experience can be compared:

  - Each plugin skill becomes an MCP **prompt** (invoked by name)
  - Memory files are exposed as **resources** (browsable)
  - Memory read/write/list are exposed as **tools** (callable)

Run with:
    python3 server.py

Or via Claude Desktop / Claude Code MCP config (see README.md).
"""

from __future__ import annotations

import re
from pathlib import Path

from mcp.server.fastmcp import FastMCP

# ──────────────────────────────────────────────────────────────────────
# Paths — server reads from the sibling agency-os/ folder
# ──────────────────────────────────────────────────────────────────────
SERVER_DIR = Path(__file__).resolve().parent
PLUGIN_ROOT = SERVER_DIR.parent / "agency-os"
SKILLS_DIR = PLUGIN_ROOT / "skills"
MEMORY_DIR = PLUGIN_ROOT / "memory"

if not SKILLS_DIR.exists():
    raise RuntimeError(
        f"Cannot find skills directory at {SKILLS_DIR}. "
        "This server must live at <repo>/mcp-server/ alongside <repo>/agency-os/."
    )

mcp = FastMCP("agency-os")


# ──────────────────────────────────────────────────────────────────────
# Skill parsing
# ──────────────────────────────────────────────────────────────────────
FRONTMATTER_RE = re.compile(r"^---\s*\n(.*?)\n---\s*\n(.*)$", re.DOTALL)


def parse_skill(skill_md: Path) -> tuple[str, str, str] | None:
    """Return (name, description, body) parsed from a SKILL.md file."""
    text = skill_md.read_text(encoding="utf-8")
    m = FRONTMATTER_RE.match(text)
    if not m:
        return None
    frontmatter, body = m.group(1), m.group(2).strip()

    name_m = re.search(r"^name:\s*(.+?)$", frontmatter, re.MULTILINE)
    desc_m = re.search(
        r"^description:\s*(.+?)(?=\n[a-zA-Z_-]+:|\Z)",
        frontmatter,
        re.MULTILINE | re.DOTALL,
    )

    name = name_m.group(1).strip() if name_m else skill_md.parent.name
    description = (
        " ".join(desc_m.group(1).split()) if desc_m else f"Skill: {name}"
    )
    return name, description, body


def load_all_skills() -> dict[str, tuple[str, str]]:
    """Return {skill_name: (description, body)} for every skill on disk."""
    skills: dict[str, tuple[str, str]] = {}
    for child in sorted(SKILLS_DIR.iterdir()):
        if not child.is_dir():
            continue
        skill_md = child / "SKILL.md"
        if not skill_md.exists():
            continue
        parsed = parse_skill(skill_md)
        if parsed is None:
            continue
        name, description, body = parsed
        skills[name] = (description, body)
    return skills


SKILLS = load_all_skills()


# ──────────────────────────────────────────────────────────────────────
# Register every skill as an MCP prompt
# Skills are static text — when Claude invokes the prompt, it receives
# the skill body as user-message content (treats it as instructions).
# ──────────────────────────────────────────────────────────────────────
def _make_handler(body: str):
    """Closure factory so each prompt captures its own body."""

    def handler() -> str:
        return body

    return handler


for skill_name, (description, body) in SKILLS.items():
    handler = _make_handler(body)
    handler.__name__ = f"skill_{skill_name.replace('-', '_')}"
    handler.__doc__ = description
    mcp.prompt(name=skill_name, description=description)(handler)


# ──────────────────────────────────────────────────────────────────────
# Memory tools
# ──────────────────────────────────────────────────────────────────────
def _safe_memory_path(filename: str) -> Path | None:
    """Resolve filename inside MEMORY_DIR, refusing escapes."""
    target = (MEMORY_DIR / filename).resolve()
    try:
        target.relative_to(MEMORY_DIR.resolve())
    except ValueError:
        return None
    return target


@mcp.tool()
def memory_list() -> list[str]:
    """List every memory file (relative paths from memory/ root).

    Includes bootstrap files (mvv.md, icp.md, etc.), pillar files
    (audio-logo.md, methodology.md), the roadmap, and any per-client
    engagement files under clients/{slug}/.
    """
    if not MEMORY_DIR.exists():
        return []
    files = []
    for path in sorted(MEMORY_DIR.rglob("*.md")):
        files.append(str(path.relative_to(MEMORY_DIR)))
    return files


@mcp.tool()
def memory_read(filename: str) -> str:
    """Read a memory file by relative path.

    Examples: 'mvv.md', 'icp.md', 'clients/acme/process-map.md'.
    Returns the file contents or an error string if missing or out of scope.
    """
    target = _safe_memory_path(filename)
    if target is None:
        return f"Error: '{filename}' is outside the memory directory."
    if not target.exists():
        return f"Error: '{filename}' does not exist."
    return target.read_text(encoding="utf-8")


@mcp.tool()
def memory_write(filename: str, content: str) -> str:
    """Write a memory file by relative path. Creates parent dirs as needed.

    Examples: filename='mvv.md', filename='clients/acme/sprint-plan.md'.
    Refuses paths that escape the memory directory.
    """
    target = _safe_memory_path(filename)
    if target is None:
        return f"Error: '{filename}' is outside the memory directory."
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(content, encoding="utf-8")
    return f"Wrote {filename} ({len(content)} chars)."


@mcp.tool()
def list_skills() -> list[dict]:
    """List every skill the server knows about.

    Useful for discovery — Claude can call this to see what's available
    instead of relying on auto-trigger.
    """
    return [
        {"name": name, "description": desc}
        for name, (desc, _body) in SKILLS.items()
    ]


# ──────────────────────────────────────────────────────────────────────
# Memory exposed as resources too — so Claude can browse them in
# Claude Desktop's resource picker
# ──────────────────────────────────────────────────────────────────────
@mcp.resource("memory://list")
def resource_memory_list() -> str:
    """Index of every memory file currently on disk."""
    files = memory_list()
    if not files:
        return "(memory is empty)"
    return "\n".join(f"- {f}" for f in files)


@mcp.resource("memory://{filename}")
def resource_memory_file(filename: str) -> str:
    """Read a specific memory file as a resource."""
    return memory_read(filename)


# ──────────────────────────────────────────────────────────────────────
# Entry point
# ──────────────────────────────────────────────────────────────────────
if __name__ == "__main__":
    mcp.run()

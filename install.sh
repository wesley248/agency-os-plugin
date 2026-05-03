#!/usr/bin/env bash
# Agency OS — student installer (zip / offline distribution)
# Installs the plugin into Claude Code's local marketplace.
#
# For automatic updates, prefer the GitHub install path documented in README.md.

set -euo pipefail

PLUGIN_NAME="agency-os"
MARKETPLACE_NAME="local-desktop-app-uploads"
MARKETPLACE_DIR="${HOME}/.claude/plugins/marketplaces/${MARKETPLACE_NAME}"
MARKETPLACE_JSON="${MARKETPLACE_DIR}/.claude-plugin/marketplace.json"
TARGET="${MARKETPLACE_DIR}/${PLUGIN_NAME}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="${REPO_ROOT}/agency-os"

if [ ! -d "${SOURCE}" ]; then
  echo "❌ Plugin source not found at ${SOURCE}"
  echo "   Make sure you're running this from the repo root after unzipping."
  exit 1
fi

echo "Installing Agency OS plugin..."
echo "  Source: ${SOURCE}"
echo "  Target: ${TARGET}"
echo ""

# Check Claude Code's plugin directory exists
if [ ! -d "${HOME}/.claude/plugins" ]; then
  echo "❌ ${HOME}/.claude/plugins not found."
  echo "   Make sure Claude Code is installed and has been run at least once."
  exit 1
fi

# Create the marketplace structure if it doesn't exist
if [ ! -d "${MARKETPLACE_DIR}/.claude-plugin" ]; then
  echo "Creating local marketplace at ${MARKETPLACE_DIR}..."
  mkdir -p "${MARKETPLACE_DIR}/.claude-plugin"
  cat > "${MARKETPLACE_JSON}" <<'EOF'
{
  "name": "local-desktop-app-uploads",
  "version": "1.0.0",
  "description": "Locally uploaded plugins via Claude Desktop app",
  "owner": {
    "name": "Local User"
  },
  "plugins": []
}
EOF
fi

# Backup existing install if present
if [ -e "${TARGET}" ]; then
  BACKUP="${TARGET}.bak.$(date +%s)"
  echo "Existing install found. Backing up to ${BACKUP}"
  mv "${TARGET}" "${BACKUP}"
fi

# Copy the plugin into the marketplace folder
mkdir -p "$(dirname "${TARGET}")"
cp -R "${SOURCE}" "${TARGET}"

# Source already only contains agency-os/ contents — no dev scripts to strip

# Register the plugin in marketplace.json (idempotent)
python3 - "${MARKETPLACE_JSON}" <<'PYEOF'
import json
import sys

path = sys.argv[1]
with open(path) as f:
    data = json.load(f)

plugins = data.setdefault("plugins", [])
if any(p.get("name") == "agency-os" for p in plugins):
    print("agency-os already registered in marketplace.json")
else:
    plugins.append({
        "name": "agency-os",
        "version": "0.1.0",
        "description": "Agency Operating System — interview-driven plugin (MVV, Offer Stack, 8 Value Drivers, Sprint Framework).",
        "source": "./agency-os",
    })
    with open(path, "w") as f:
        json.dump(data, f, indent=2)
    print("Registered agency-os in marketplace.json")
PYEOF

echo ""
echo "✓ Plugin files installed to ${TARGET}"
echo ""
echo "──────────────────────────────────────────────────────────────"
echo "  Next steps — run these inside Claude Code:"
echo ""
echo "    /plugin install agency-os@local-desktop-app-uploads"
echo ""
echo "  Then restart Claude Code (or /reload-plugins) and try:"
echo ""
echo "    /setup-agency-os"
echo "──────────────────────────────────────────────────────────────"
echo ""

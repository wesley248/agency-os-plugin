#!/usr/bin/env bash
# Agency OS — build distributable zips
# Produces two zips for two install paths:
#   1. agency-os-plugin.zip   — marketplace zip (for bash install.sh)
#   2. agency-os.zip          — single-plugin zip (for Claude Desktop upload UI)

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="${ROOT}/dist"

cd "${ROOT}"

mkdir -p "${DIST}"

# ──────────────────────────────────────────────────────────────
# Zip 1 — Marketplace zip (for bash install.sh path)
# Contains the whole repo: marketplace.json at root, plugin in
# agency-os/ subfolder, install.sh at root.
# ──────────────────────────────────────────────────────────────
MARKETPLACE_ZIP="${DIST}/agency-os-plugin.zip"
echo "Building marketplace zip..."
rm -f "${MARKETPLACE_ZIP}"
zip -r "${MARKETPLACE_ZIP}" . \
  -x "dist/*" \
  -x "scripts/*" \
  -x ".git/*" \
  -x ".DS_Store" \
  -x "**/.DS_Store" \
  -x "mcp-server/.venv/*" \
  -x "**/.venv/*" \
  -x "**/__pycache__/*" \
  -x "**/*.pyc" \
  > /dev/null
echo "✓ ${MARKETPLACE_ZIP}"
echo "  Size: $(du -h "${MARKETPLACE_ZIP}" | cut -f1)"
echo "  Use: download, unzip, run 'bash install.sh'"
echo ""

# ──────────────────────────────────────────────────────────────
# Zip 2 — Single-plugin zip (for Claude Desktop "Upload local plugin")
# Contains just the contents of agency-os/ at the zip root.
# Plugin.json sits at .claude-plugin/plugin.json (zip-root relative).
# ──────────────────────────────────────────────────────────────
SINGLE_ZIP="${DIST}/agency-os.zip"
echo "Building single-plugin zip..."
rm -f "${SINGLE_ZIP}"
cd "${ROOT}/agency-os"
zip -r "${SINGLE_ZIP}" . \
  -x ".DS_Store" \
  -x "**/.DS_Store" \
  > /dev/null
cd "${ROOT}"
echo "✓ ${SINGLE_ZIP}"
echo "  Size: $(du -h "${SINGLE_ZIP}" | cut -f1)"
echo "  Use: drag onto Claude Desktop's 'Upload local plugin' dialog"
echo ""

echo "──────────────────────────────────────────────────────────"
echo "Built 2 zips. Share whichever matches the student's install path."

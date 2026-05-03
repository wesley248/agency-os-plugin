#!/usr/bin/env bash
# Agency OS — build the distributable zip
# Run from anywhere; produces dist/agency-os-plugin.zip

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="${ROOT}/dist"
ZIP_NAME="agency-os-plugin.zip"

cd "${ROOT}"

echo "Building distributable zip..."

mkdir -p "${DIST}"
rm -f "${DIST}/${ZIP_NAME}"

# Zip everything except dev artefacts
zip -r "${DIST}/${ZIP_NAME}" . \
  -x "dist/*" \
  -x "scripts/*" \
  -x ".git/*" \
  -x ".DS_Store" \
  -x "**/.DS_Store"

echo ""
echo "✓ Built: ${DIST}/${ZIP_NAME}"
echo "  Size: $(du -h "${DIST}/${ZIP_NAME}" | cut -f1)"
echo ""
echo "Share this file with students. They run install.sh after unzipping."

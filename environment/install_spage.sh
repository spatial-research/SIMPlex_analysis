#!/usr/bin/env bash
# Install SpaGE at the pinned commit from environment/spage.lock.json.
# Usage: bash environment/install_spage.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCKFILE="$REPO_ROOT/environment/spage.lock.json"
VENDOR="$REPO_ROOT/environment/vendor/SpaGE"
SETUP_PY="$REPO_ROOT/environment/spage/setup.py"

if ! command -v conda >/dev/null 2>&1; then
  echo "conda not found in PATH" >&2
  exit 1
fi
if ! command -v git >/dev/null 2>&1; then
  echo "git not found in PATH (required to fetch SpaGE)" >&2
  exit 1
fi
if [[ ! -f "$LOCKFILE" ]]; then
  echo "Missing lockfile: $LOCKFILE" >&2
  exit 1
fi
if [[ ! -f "$SETUP_PY" ]]; then
  echo "Missing packaging shim: $SETUP_PY" >&2
  exit 1
fi

mapfile -t _spage_lock < <(
  python3 - "$LOCKFILE" <<'PY'
import json
import sys

lock = json.load(open(sys.argv[1], encoding="utf-8"))
spage = lock["SpaGE"]
print(spage["repository"])
print(spage["commit"])
print(spage["package_version"])
PY
)
SPAGE_REPO="${_spage_lock[0]}"
SPAGE_COMMIT="${_spage_lock[1]}"
SPAGE_VERSION="${_spage_lock[2]}"
unset _spage_lock

if [[ -z "$SPAGE_REPO" || -z "$SPAGE_COMMIT" || -z "$SPAGE_VERSION" ]]; then
  echo "Failed to parse SpaGE pin from $LOCKFILE" >&2
  exit 1
fi

# shellcheck source=/dev/null
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate simplex

checkout_spage() {
  mkdir -p "$(dirname "$VENDOR")"
  if [[ ! -d "$VENDOR/.git" ]]; then
    echo "Cloning SpaGE ($SPAGE_COMMIT) ..."
    git clone "$SPAGE_REPO" "$VENDOR"
  fi
  echo "Checking out SpaGE commit $SPAGE_COMMIT ..."
  git -C "$VENDOR" fetch --depth 1 origin "$SPAGE_COMMIT"
  git -C "$VENDOR" checkout --detach "$SPAGE_COMMIT"
}

current_commit() {
  git -C "$VENDOR" rev-parse HEAD 2>/dev/null || true
}

if [[ "$(current_commit)" == "$SPAGE_COMMIT" ]] && python -c "from SpaGE.main import SpaGE" >/dev/null 2>&1; then
  echo "SpaGE already installed at pinned commit $SPAGE_COMMIT."
  exit 0
fi

checkout_spage
if [[ "$(current_commit)" != "$SPAGE_COMMIT" ]]; then
  echo "SpaGE checkout failed: expected $SPAGE_COMMIT, got $(current_commit)" >&2
  exit 1
fi

cp "$SETUP_PY" "$VENDOR/setup.py"
echo "Installing SpaGE $SPAGE_VERSION (commit $SPAGE_COMMIT) into conda env 'simplex' ..."
pip install --upgrade "$VENDOR"

python -c "
import json
from SpaGE.main import SpaGE

lock = json.load(open('$LOCKFILE', encoding='utf-8'))
expected = lock['SpaGE']['commit']
print('SpaGE import OK:', SpaGE.__name__, '| pinned commit:', expected[:7])
"

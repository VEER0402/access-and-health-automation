#!/bin/bash
set -euo pipefail

# ===== Logging added here =====
LOG_FILE="../logs/github_report_$(date +%F_%H%M%S).log"
exec > >(tee -a "$LOG_FILE") 2>&1
# ==============================

API_URL="https://api.github.com"

: "${GITHUB_USER:?Please export GITHUB_USER}"
: "${GITHUB_TOKEN:?Please export GITHUB_TOKEN}"

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <repo-owner> <repo-name>"
  exit 1
fi

REPO_OWNER="$1"
REPO_NAME="$2"

AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"
ACCEPT_HEADER="Accept: application/vnd.github.v3+json"

github_api_get() {
  local endpoint="$1"
  curl -sS -H "$AUTH_HEADER" -H "$ACCEPT_HEADER" "${API_URL}/${endpoint}"
}

echo "=== GitHub Access Report for $REPO_OWNER/$REPO_NAME ==="

collaborators=$(github_api_get "repos/$REPO_OWNER/$REPO_NAME/collaborators" | jq -r '.[] | "\(.login)\tadmin:\(.permissions.admin)\tpush:\(.permissions.push)\tpull:\(.permissions.pull)"')

if [[ -z "$collaborators" ]]; then
    echo "No collaborators found."
else
    echo "$collaborators"
fi

echo "Report generated."


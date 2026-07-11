#!/bin/bash
#
# Copy papers to the server and fetch new PDFs from the server

set -euo pipefail

REMOTE_HOST="mikko@vitalik7-tailscale"
REMOTE_DIR="./code/docs"

# Remove nested copies created when a remote articles/articles directory is
# pulled back into the local articles directory.
rm -rf articles/articles
ssh "$REMOTE_HOST" "rm -rf '$REMOTE_DIR/articles/articles'"

rsync -av --inplace \
  --include='*/' \
  --include='*.pdf' \
  --exclude='*' \
  articles/ "$REMOTE_HOST:$REMOTE_DIR/articles/"

rsync -av --inplace --ignore-existing \
  --include='*/' \
  --include='*.pdf' \
  --exclude='*' \
  "$REMOTE_HOST:$REMOTE_DIR/articles/" articles/

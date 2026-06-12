#!/bin/bash
#
# Copy papers to the server and fetch new PDFs from the server

set -euo pipefail

REMOTE="mikko@vitalik7-tailscale:./code/docs"

rsync -av --inplace articles "$REMOTE/"

rsync -av --inplace --ignore-existing \
  --include='*/' \
  --include='*.pdf' \
  --exclude='*' \
  "$REMOTE/articles/" articles/

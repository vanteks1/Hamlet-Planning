#!/bin/bash

# Hamlet Planning Sync Script
# This script pulls and pushes changes to the GitHub upstream.

set -e

REPO_DIR="/home/vante/geminiWorkspace/Hamlet-Planning"

cd "$REPO_DIR"

echo "[$(date)] Starting sync..."

# Fetch and rebase to keep history clean
git fetch origin
git pull --rebase origin main

# Check if there are changes to push
if ! git diff --quiet HEAD origin/main; then
    echo "[$(date)] Pushing local changes..."
    git push origin main
else
    echo "[$(date)] No local changes to push."
fi

echo "[$(date)] Sync complete."

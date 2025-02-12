#!/bin/bash

# Navigate to the correct Git repository
cd /Users/pamelasanchezhernandez/sony-apprenticeship-log || { echo "❌ Failed to enter repo"; exit 1; }

# Verify we are inside a Git repository
if [ ! -d ".git" ]; then
  echo "❌ Error: Not a Git repository!"
  exit 1
fi

# Pull the latest changes
git pull origin main --rebase

# Add and commit new changes
git add .
git commit -m "Auto-sync commit on $(date +'%Y-%m-%d %H:%M:%S')" || echo "No changes to commit"

# Push to GitHub
git push origin main || echo "No new changes to push"

echo "✅ Local Git auto-sync complete!"



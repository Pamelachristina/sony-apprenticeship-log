#!/bin/bash

# Navigate to the correct Git repository
cd /Users/pamelasanchezhernandez/sony-apprenticeship-log || { echo "❌ Failed to enter repo"; exit 1; }

# Verify we are inside a Git repository
if [ ! -d ".git" ]; then
  echo "❌ Error: Not a Git repository!"
  exit 1
fi

git stash push -m "Auto-stash before pulling latest changes"
git pull origin main --rebase
git stash pop || echo "❌ No stash to apply"


# Add and commit new changes
git add -A logs/*


git commit -am "Auto-sync log updates on $(date +'%Y-%m-%d %H:%M:%S')" || echo "No new log changes to commit"

# Push to GitHub
git push origin main || echo "No new changes to push"

echo "✅ Local Git auto-sync complete!"



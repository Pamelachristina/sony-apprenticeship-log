#!/bin/bash
cd "$(pwd)" || exit

# Pull the latest changes
git pull origin main  # Change 'main' to your actual branch

# Add your updates
git add .

# Commit with timestamp
git commit -m "Automated commit - $(date)"

# Push changes
git push origin main  # Change 'main' to your actual branch


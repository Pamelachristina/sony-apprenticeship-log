#!/bin/bash

# Set the date variables
TODAY=$(date +"%Y-%m-%d")
LOG_DIR="logs"
LOG_FILE="$LOG_DIR/$TODAY.md"
MASTER_LOG="daily-log.md"

# Ensure the logs directory exists
mkdir -p $LOG_DIR

# Create the daily log file if it doesn't exist
if [ ! -f "$LOG_FILE" ]; then
    cat > "$LOG_FILE" <<EOL
# Daily Log - $TODAY

### ✅ Tasks Completed
-

### 📖 Key Learnings
-

### ⚠️ Challenges
-

### 🔜 Next Steps
-

### 🔗 Links/Resources
-

---
EOL

    # Append link to master log
    echo "- [$TODAY](logs/$TODAY.md)" >> "$MASTER_LOG"

    # Commit and push
    git add "$LOG_FILE" "$MASTER_LOG"
    git commit -m "Added daily log for $TODAY"
    git push origin main
    echo "✅ Log for $TODAY created and pushed to GitHub."
else
    echo "⚠️ Log for $TODAY already exists."
fi


#!/bin/bash

# 1. Run Build
echo "📦 Building..."
npm run build
if [ $? -ne 0 ]; then
  echo "❌ Build failed. Aborting."
  exit 1
fi

# 2. Stage Changes
git add .

# 3. Generate Commit Message
# This gets a list of changed files (status) as the message
CHANGES=$(git status --short)
if [ -z "$CHANGES" ]; then
  echo "✨ No changes to commit."
  exit 0
fi

MESSAGE="chore: automated pack with changes in:
$CHANGES"

# 4. Commit
echo "💾 Committing..."
git commit -m "$MESSAGE"

# 5. Push
echo "🚀 Pushing to origin..."
git push origin HEAD
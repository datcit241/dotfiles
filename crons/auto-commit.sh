#!/bin/bash

project_path="${1}"

if [ -z "${project_path}" ]; then
  echo "Error: No input file specified."
  echo "Usage: $0 /path/to/your/project"
  exit 1
fi

# Navigate to the project directory
cd "$project_path" || exit

# Check for changes
if [[ -n $(git status --porcelain) ]]; then
  # Stage all changes
  git add .

  # Commit with a timestamp message
  git commit -m "Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"

  if ! git pull --rebase; then
    echo "Error: Merge conflicts detected. Resolve conflicts before committing."
    exit 1
  fi

  # Push changes
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git push origin "$CURRENT_BRANCH"
fi

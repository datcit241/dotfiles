#!/bin/sh

# Check if a file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# Check if fzf is installed
if ! command -v fzf >/dev/null; then
  echo "fzf is not installed. Please install it first."
  exit 1
fi

# Check if xclip is installed
if ! command -v xclip >/dev/null; then
  echo "xclip is not installed. Please install it first."
  exit 1
fi

# Read the file and use fzf to select lines
selected=$(grep -v '^[[:space:]]*$' "$1" | tr -d '\r' | fzf --multi)

# Copy each selected line to the clipboard one at a time
echo "$selected" | while IFS= read -r line; do
  trimmed_line=$(echo "${line}" | sed -e 's/\s*$//')
  if [ -n "$trimmed_line" ]; then
    echo -n "$trimmed_line" | xclip -selection clipboard
    echo "Copied: $trimmed_line"
  fi
done

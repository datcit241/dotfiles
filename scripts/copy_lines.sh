#!/bin/sh

# Check if the file path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# Read the file line by line
while IFS= read -r line; do
  # Trim whitespace from the line
  trimmed_line=$(echo "${line}" | sed -e 's/\s*$//')

  if [ -n "$trimmed_line" ]; then
    echo -n "$trimmed_line" | xclip -selection clipboard
  fi
done <"$1"
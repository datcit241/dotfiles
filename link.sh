#!/bin/bash

# Check if jq is installed
if ! command -v jq >/dev/null; then
  echo "jq is required but not installed. Please install jq."
  exit 1
fi

# Check if the user provided a directory path
if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_directory_or_sources.json>"
  exit 1
fi

# Assign the provided directory path to a variable
SOURCE_PATH="$1"

# Determine the path to sources.json
if [[ "$SOURCE_PATH" != *.json ]]; then
  SOURCE_PATH="$SOURCE_PATH/sources.json"
fi

if [[ "$SOURCE_PATH" != /* ]]; then
  SOURCE_PATH=$(readlink -f "$SOURCE_PATH")
fi
# Check if sources.json exists in the provided directory
if [ ! -f "$SOURCE_PATH" ]; then
  echo "Error: sources.json not found in the specified directory."
  exit 1
fi

# Read and parse the JSON file
JSON_CONTENT=$(cat "$SOURCE_PATH")

# Extract the sources and destinations using jq
PAIRS=$(echo "$JSON_CONTENT" | jq -c '.unix[]')

# Create soft links for each source-destination pair
for PAIR in $PAIRS; do
  SOURCE=$(echo "$PAIR" | jq -r '.[0]')
  DESTINATION=$(echo "$PAIR" | jq -r '.[1]')

  # Expand environment variables in the destination path
  DESTINATION=$(eval echo "$DESTINATION")

  # Resolve path if it's relative
  if [[ "$SOURCE" != /* ]]; then
    SOURCE_DIR=$(dirname "$SOURCE_PATH")
    # SOURCE="$SOURCE_DIR/$SOURCE"
    cd "$SOURCE_DIR" || return $? # Change directory to the source path
    SOURCE=$(readlink -f "$SOURCE")
    cd -
  fi

  # Convert relative source path to absolute path
  if [[ "$SOURCE" != /* ]]; then
    SOURCE="$PWD/$SOURCE"
  fi

  # Create the soft link
  echo "ln -s ${SOURCE} ${DESTINATION}"
  ln -s "$SOURCE" "$DESTINATION"
done

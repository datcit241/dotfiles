#!/bin/bash

# Check if jq is installed
if ! command -v jq >/dev/null; then
  echo "jq is required but not installed. Please install jq."
  exit 1
fi

# Check if the user provided a directory path
if [ -z "$1" ]; then
  echo "Usage: $0 [-i | --interactive] <path_to_directory_or_sources_file.json>"
  exit 1
fi

# Check for interactive flag
INTERACTIVE=false
if [[ "$1" == "-i" || "$1" == "--interactive" ]]; then
  INTERACTIVE=true
  shift
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

# Use fzf to allow the user to select multiple items if interactive mode is enabled
if [ "$INTERACTIVE" = true ]; then
  # Check if fzf is installed
  if ! command -v fzf >/dev/null; then
    echo "fzf is required for interactive mode but not installed. Please install fzf."
    exit 1
  fi
  SELECTED_PAIRS=$(echo "$PAIRS" | fzf --multi)
else
  SELECTED_PAIRS="$PAIRS"
fi

# Create soft links for each source-destination pair
for PAIR in $SELECTED_PAIRS; do
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
    cd - || return $? # Change back to the original directory
  fi

  # Convert relative source path to absolute path
  if [[ "$SOURCE" != /* ]]; then
    SOURCE="$PWD/$SOURCE"
  fi

  DEST_PARENT_DIR=$(dirname "$DESTINATION")
  if [ ! -d "$DEST_PARENT_DIR" ]; then
    echo "Creating directory: $DEST_PARENT_DIR"
    if mkdir -p "$DEST_PARENT_DIR" 2>/dev/null; then
      echo "Directory created successfully."
    else
      echo "Permission denied. Attempting with sudo..."
      sudo mkdir -p "$DEST_PARENT_DIR"
    fi
  fi

  # Check if the destination already exists
  if [ -e "$DESTINATION" ] || [ -L "$DESTINATION" ]; then
    read -p "File '$DESTINATION' already exists. Overwrite? (y/N): " OVERWRITE
    if [[ "$OVERWRITE" =~ ^[Yy]$ ]]; then
      read -p "Are you sure you want to overwrite '$DESTINATION'? (y/N): " CONFIRM
      if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
        BACKUP_FILE="${DESTINATION}.backup-$(date +%Y%m%d-%H%M%S)"
        echo "Creating backup: ${DESTINATION} -> ${BACKUP_FILE}"
        if ! mv "$DESTINATION" "$BACKUP_FILE" 2>/dev/null; then
          sudo mv "$DESTINATION" "$BACKUP_FILE"
        fi
        echo "Backup created at ${BACKUP_FILE}"
        rm -f "$DESTINATION" 2>/dev/null || sudo rm -f "$DESTINATION"
      fi
    else
      echo "Skipping '$DESTINATION'"
      continue
    fi
  fi

  # Create the soft link
  echo "Creating symlink: ${SOURCE} -> ${DESTINATION}"
  if ln -s "$SOURCE" "$DESTINATION" 2>/dev/null; then
    echo "Symlink created successfully."
  else
    echo "Permission denied. Attempting with sudo..."
    sudo ln -s "$SOURCE" "$DESTINATION"
  fi
done

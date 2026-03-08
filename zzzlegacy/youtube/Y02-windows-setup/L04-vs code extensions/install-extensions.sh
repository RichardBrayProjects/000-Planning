#!/bin/bash

# Get already installed extensions
installed=$(code --list-extensions)

# Install only missing ones
while read -r extension; do

  # Ignore lines starting with #
  [[ "$extension" == \#* ]] && continue

  # Also ignore empty lines 
  [[ -z "$extension" ]] && continue

  if echo "$installed" | grep -q "^${extension}$"; then
    echo "$extension already installed"
  else
    echo "Installing $extension..."
    code --install-extension "$extension"
  fi
done < vscode-extensions-list.txt

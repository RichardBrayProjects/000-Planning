#!/bin/bash 
# --- Pre-requisite Checks (Optional but Recommended) --- 
# Ensure gh and jq are installed. If not, the script will likely fail. 
# On a Mac, you can install them using Homebrew: 
# brew install gh jq 
# gh auth login # Important: Make sure you're authenticated with GitHub CLI 
  
# --- Core Script Logic --- 
  
echo "Searching for repositories in richardbrayprojects ... " 
  
# Step 1: List repos and get both 'name' (the repo's actual name) 
# and 'nameWithOwner' (owner/repo format for cloning). 
REPO_LIST=$(gh repo list richardbrayprojects --limit 1000 --json name,nameWithOwner) 
  
# Step 2: Use jq to filter based on the 'name' field starting with '0' or '1' 
# and then output the 'nameWithOwner' field. 
FILTERED_REPOS=$(echo "$REPO_LIST" | jq -r '.[] | select(.name ) | .nameWithOwner') 
  
# Step 3: Check if any repositories were found 
if [ -z "$FILTERED_REPOS" ]; then 
  echo "No repositories found for richardbrayprojects" 
  echo "Please double-check if such repositories exist in your GitHub account." 
  exit 0 
fi 
  
# Step 4: Loop through the filtered repository paths and clone them 
echo "Found repositories. Cloning them now..." 
echo "$FILTERED_REPOS" | while read repo; do 
  echo "Cloning $repo..." 
  gh repo clone "$repo" 
  if [ $? -ne 0 ]; then 
    echo "Error cloning $repo. Skipping to next." 
  fi 
done 
  
echo "Script finished." 

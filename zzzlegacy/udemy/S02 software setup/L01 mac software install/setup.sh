#!/bin/bash

# Cache sudo credentials upfront
sudo -v

# Keep sudo alive in background
while true; do
    sudo -n true              # Refresh sudo (no password prompt)
    sleep 60                   # Wait 60 seconds
    kill -0 "$$" || exit      # Exit if parent script dies
done 2>/dev/null &

formulas=(
    git
    node
    awscli
    aws-cdk
    pnpm
    flyway
)

echo "Installing formulas..."
for formula in "${formulas[@]}"; do
    echo "Installing $formula..."
    brew install "$formula" --quiet
done

casks=(
    google-chrome
    visual-studio-code
    git-credential-manager
    github
    pgadmin4
    docker
)

echo "Installing casks..."
for cask in "${casks[@]}"; do
    echo "Installing $cask..."
    brew install --cask "$cask" --force --quiet
done

echo "Configuring git-credential-manager..."
git-credential-manager configure

# Kill the background sudo keep-alive process
kill %1 2>/dev/null

echo "Done!"

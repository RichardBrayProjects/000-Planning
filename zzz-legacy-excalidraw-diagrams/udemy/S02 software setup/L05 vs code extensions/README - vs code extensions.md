# Install Extensions as required

Copy the following into a new file ~/install-vscode-extensions.sh

```bash
nano ~/install-vscode-extensions.sh
```

```bash
#!/bin/bash

# Write the extensions into the file
cat > vscode-extensions-list.txt <<EOL
albert.tabout
bradlc.vscode-tailwindcss
christian-kohler.path-intellisense
dbaeumer.vscode-eslint
dsznajder.es7-react-js-snippets
esbenp.prettier-vscode
formulahendry.auto-rename-tag
inferrinizzard.prettier-sql-vscode
mhutchie.git-graph
ms-vscode-remote.remote-wsl
ms-vscode.vscode-typescript-next
peakchen90.open-html-in-browser
redhat.vscode-yaml
ritwickdey.liveserver
vincaslt.highlight-matching-tag
yoavbls.pretty-ts-errors
EOL

# Get already installed extensions
installed=$(code --list-extensions)

# Install only missing ones
while read -r extension; do
  if echo "$installed" | grep -q "^${extension}$"; then
    echo "$extension already installed"
  else
    echo "Installing $extension..."
    code --install-extension "$extension"
  fi
done < vscode-extensions-list.txt
```

Now set permissions to allow it to execute

```bash
chmod 755 install-vscode-extensions.sh
```

Now execute the script to create extensions

```bash
./install-vscode-extensions.sh
```

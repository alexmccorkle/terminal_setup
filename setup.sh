#!/bin/bash

# Install Homebrew if not installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Fish
echo "Installing Fish..."
brew install fish

# Add fish to the list of acceptable shells
if ! grep -Fxq "/opt/homebrew/bin/fish" /etc/shells
then
    echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
fi

# Make fish default
chsh -s /opt/homebrew/bin/fish

# Copy config file
echo "Copying config file..."
mkdir -p ~/.config/fish
cp -r fish/* ~/.config/fish/

echo 'set -g fish_user_paths "/opt/homebrew/bin" $fish_user_paths' >> ~/.config/fish/config.fish

echo "Set-up complete. Please restart terminal for a fishy experience!"


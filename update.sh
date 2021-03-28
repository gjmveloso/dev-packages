#!/usr/bin/bash

echo "Updating packages list..."

echo "brew"
brew tap > packages/brew.txt
brew leaves >> packages/brew.txt
brew list --cask >> packages/brew.txt
echo "npm"
npm list -g --depth=0 > packages/npm.txt
echo "pip"
pip3 list --format columns > packages/pip.txt
echo "gems"
gem list > packages/gems.txt
echo "

Copying global .gitignore ..."
cp ~/.gitignore dotfiles/.gitignore
echo "Copying global .gitconfig ..."
cp ~/.gitconfig dotfiles/.gitconfig
echo "Copying VSCode extensions ..."
code --list-extensions > packages/vscode.txt
echo "Copying VSCode settings ..."
cp ~/Library/Application\ Support\/Code/User/settings.json packages/vscode.settings.json
echo "Copying global .zshrc ..."
cp ~/.zshrc dotfiles/.zshrc
echo "Copying global .p10k ..."
cp ~/.p10k.zsh dotfiles/.p10k.zsh

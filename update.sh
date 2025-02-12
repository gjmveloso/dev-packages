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
echo "Copying Zed settings ..."
cp ~/.config/zed/settings.json dotfiles/zed.settings.json
echo "Copying Ghostty settings ..."
cp ~/Library/Application\ Support/com.mitchellh.ghostty/config dotfiles/ghostty
echo "Copying global .zshrc ..."
cp ~/.zshrc dotfiles/.zshrc
echo "Copying global .zprofile ..."
cp ~/.zprofile dotfiles/.zprofile
echo "Copying vale styles ..."
cp -R ~/styles packages/styles
echo "Copying vale global config ..."
cp ~/.vale.ini dotfiles/.vale.ini
echo "Copying global .starship.toml ..."
cp ~/.config/starship.toml dotfiles/.starship.toml

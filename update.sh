echo "Updating packages list..."

echo "brew"
brew list > packages/brew.txt
brew cask list >> packages/brew.txt
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
echo "Copying global init.fish ..."
cp ~/.local/share/omf/init.fish dotfiles/init.fish
echo "Copying oh-my-fish plugins"
omf list > packages/omf.txt
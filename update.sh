echo "Updating packages list ...\r\n"

echo "brew"
brew list > packages/brew.txt
echo "npm"
npm list -g --depth=0 > packages/npm.txt
echo "pip"
pip list --format columns > packages/pip.txt
echo "gems"
gem list > packages/gems.txt
echo "apm"
apm list --installed > packages/apm.txt
echo "\r\nCopying global .gitignore ..."
cp ~/.gitignore dotfiles/.gitignore
echo "Copying global .zshrc ..."
cp ~/.zshrc dotfiles/.zshrc

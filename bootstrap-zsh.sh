#!/usr/bin/env zsh

#region ZSH Config & Themes

echo "Setting zsh as default shell"

chsh -s /bin/zsh

echo "Installing oh-my-zsh"

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

# switch to zsh as shell
source ~/.zshrc

echo "Installing zsh themes"

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# theme: spaceship-prompt
mkdir $ZSH_CUSTOM/themes/spaceship-prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# theme: agnoster
mkdir $ZSH_CUSTOM/themes/agnoster
git clone https://github.com/agnoster/agnoster-zsh-theme.git "$ZSH_CUSTOM/themes/agnoster" 
ln -s "$ZSH_CUSTOM/themes/agnoster/agnoster.zsh-theme" "$ZSH_CUSTOM/themes/agnoster.zsh-theme"

cp .zshrc ~/

#endregion ZSH Config & Themes

#region Node.js

curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# refresh PATH from env
source ~/.zshrc

echo
nvm install --lts
nvm use --lts

# copy dotfile
cp .npmrc ~/

#endregion Node.js

source ~/.zshrc

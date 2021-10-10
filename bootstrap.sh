#!/usr/bin/env bash

SCRIPT_LOCATION=$(pwd)
SCRIPT_USER=$(whoami)
SCRIPT_USERID=$(id -u)

#region Prechecks

if [[ $(uname) != "Darwin" ]]; then
    echo "error: script can only be executed on macOS"
    exit 1
fi

if [[ $(id -u) -eq 0 ]]; then
    echo "error: do not run script as root. password will be prompted if needed"
    exit 1
fi

#endregion Prechecks

#region Install Brew & Brew Cask

echo "Installing Brew"

# pipe echo to make brew install unattended
echo | bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap homebrew/cask

#endregion Install Brew & Brew Cask

#region Install Brew Packages

# cli tools
brew install wget \
                git \
                azure-cli \
                awscli

# common programs
brew install --cask google-chrome \
                        microsoft-edge \
                        firefox \
                        spectacle \
                        spotify \
                        signal       

# IDEs
brew install --cask webstorm \
                        phpstorm \
                        intellij-idea \
                        visual-studio-code \
                        atom

# database mgmt tools
brew install --cask azure-data-studio \
                        sequel-pro

# other dev tools
brew install --cask sourcetree \
                        docker \
                        postman \
                        insomnia \
                        cyberduck \
                        1password \
                        macpass \
                        iterm2

#endregion Install Brew Packages

#region VSCode Settings

cp .vscode/settings.json "$HOME/Library/Application Support/Code/User/"

#endregion VSCode Settings

#region Gitconfig

# copy dotfile
cp .gitconfig ~/

#endregion Gitconfig

#region macOS system config

# show hidden files
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder

#endregion macOS system config

echo
echo "switching to ZSH shell install"
# start script part using zsh shell
zsh ./bootstrap-zsh.sh

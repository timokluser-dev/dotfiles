#!/usr/bin/env bash

#region Helpers

function show_install {
    echo "info: $1 not installed on system"
    echo "info: installing $1"
}

#endregion Helpers

brew --version > /dev/null
if [[ $? -ne 0 ]]; then
    show_install "brew"

    sudo echo | bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null

    # restart bash session
    source ~/.bash_profile
fi

# ---

ansible --version > /dev/null
if [[ $? -ne 0 ]]; then
    show_install "ansible"

    brew install ansible > /dev/null
fi

echo "installing tags: $@"
echo

me=$(whoami)
echo "👉 Enter $me's password 🔐"
ansible-playbook ./playbook.yml --become-user $me --ask-become-pass -t $@

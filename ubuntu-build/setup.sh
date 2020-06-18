#!/bin/bash
source ./setup-env.sh
set -x

# Housekeeping:
sudo apt-get update

# Install pre-requisites for Ubuntu
sudo apt-get install curl git libssl-dev pkg-config

# Get Rust and git:
sudo apt-get install curl git
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env # If not rebooted since installing Rustc

# Clone the SAFE github repositories
git clone https://github.com/maidsafe/safe-api
git clone https://github.com/maidsafe/safe-vault

# Set up alias and save to .bashrc
echo alias safe="$SAFE_CLI" >> ~/.bashrc
alias safe="$SAFE_CLI"

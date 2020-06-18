#!/bin/bash
set -x
# Housekeeping:
sudo apt-get update

# Install pre-requisites
sudo apt-get install curl git libssl-dev pkg-config # Ubuntu 
# Didn't need (already installed/latest versions): sudo apt-get install build-essential 

# Get Rust and git:
sudo apt-get install curl git
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env # If not rebooted since installing Rustc

# Clone the SAFE github repositories
mkdir -p ~/src/maidsafe
git clone https://github.com/maidsafe/safe-api
git clone https://github.com/maidsafe/safe-vault


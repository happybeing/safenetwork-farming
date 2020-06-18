#!/bin/bash
set -x

# Build SAFE CLI on Odroid-U3+, Ubuntu 16.04 LTS / 18.04 LTS
source $HOME/.cargo/env # If not rebooted since installing Rustc

cd safe-api
git pull
time cargo update
time cargo build --release # Took 74 mins
echo alias safe='~/src/maidsafe/safe-api/target/release/safe' >> ~/.bashrc
alias safe='~/src/maidsafe/safe-api/target/release/safe'

# Copy safe-authd into place
mkdir -p ~/.safe/authd
cp ~/src/maidsafe/safe-api/target/release/safe-authd ~/.safe/authd

# Select the network (e.g. shared-section)
safe networks check
# If the above complains, add a network config and select it:
safe networks add shared-section https://safe-vault-config.s3.eu-west-2.amazonaws.com/shared-section/vault_connection_info.config
safe networks switch shared-section
safe networks check
# Should be ok now!

# Build SAFE Vault:  on Odroid-U3+, Ubuntu 16.04 LTS / 18.04 LTS
source $HOME/.cargo/env # If not rebooted since installing Rustc
cd ~/src/maidsafe
cd safe-vault
git pull
time cargo update # <10 mins
time cargo build --release # 56mins
# Copy safe_vault into place
mkdir -p ~/.safe/vault
cp ~/src/maidsafe/safe-vault/target/release/safe_vault ~/.safe/vault/
		


#!/bin/bash
source ./setup-env.sh
set -x

# Build SAFE CLI on Odroid-U3+, Ubuntu 16.04 LTS / 18.04 LTS
source $HOME/.cargo/env # If not rebooted since installing Rustc

cd $SAFE_SCRIPTS_DIR/safe-api
git pull
time cargo update
time cargo build --release # Took 74 mins

# Copy safe CLI into place
mkdir -p $SAFE_CLI_DIR

cp $SAFE_CLI_BUILD $SAFE_CLI_DIR
# Copy safe-authd into place
mkdir -p $SAFE_AUTH_DIR
cp $SAFE_AUTHD_BUILD $SAFE_AUTH_DIR

# Select the network (e.g. shared-section)
$SAFE_CLI networks check
# If the above complains, add a network config and select it:
$SAFE_CLI networks add shared-section https://safe-vault-config.s3.eu-west-2.amazonaws.com/shared-section/vault_connection_info.config
$SAFE_CLI networks switch shared-section
$SAFE_CLI networks check
# Should be ok now!

# Build SAFE Vault:  on Odroid-U3+, Ubuntu 16.04 LTS / 18.04 LTS
source $HOME/.cargo/env # If not rebooted since installing Rustc
cd $SAFE_SCRIPTS_DIR/safe-vault
git pull
time cargo update # <10 mins
time cargo build --release # 56mins

# Copy safe_vault into place
mkdir -p $SAFE_VAULT_DIR
cp $SAFE_VAULT_BUILD $SAFE_VAULT_DIR

#!/bin/bash
source ./setup-env.sh
set -x

# Build SAFE CLI on Odroid-U3+, Ubuntu 16.04 LTS / 18.04 LTS
source $HOME/.cargo/env # If not rebooted since installing Rustc

rm -rf $HOME/.safe

# Update build tools
rustup update

echo cd $SAFE_SCRIPTS_DIR/sn_cli
cd $SAFE_SCRIPTS_DIR/sn_cli
git checkout . -f
git pull
time cargo build --release

# Copy Safe CLI into place
mkdir -p $SAFE_CLI_DIR
cp $SAFE_CLI_BUILD $SAFE_CLI_DIR

# Copy Safe Authd into place
mkdir -p $SAFE_AUTH_DIR
cp $SAFE_AUTHD_BUILD $SAFE_AUTH_DIR

# If the above complains, add a network config and select it:
safe networks add fleming-testnet https://sn-node.s3.eu-west-2.amazonaws.com/config/node_connection_info.config
$SAFE_CLI networks switch fleming-testnet
$SAFE_CLI networks check
# Should be ok now!

# Build SAFE node:  on Odroid-U3+, Ubuntu 16.04 LTS / 18.04 LTS
source $HOME/.cargo/env # If not rebooted since installing Rustc
cd $SAFE_SCRIPTS_DIR/safe_network
git checkout . -f
git pull
time cargo build --release

# Copy Safe Node into place
mkdir -p $SAFE_NODE_DIR
cp $SAFE_NODE_BUILD $SAFE_NODE_DIR

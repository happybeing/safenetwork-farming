#!/bin/bash
#
# Environment for other scripts
export SAFE_SCRIPTS_DIR=$PWD

export SAFE_CLI_DIR=$HOME/.safe/cli
export SAFE_AUTH_DIR=$HOME/.safe/authd
export SAFE_NODE_DIR=$HOME/.safe/node

export SAFE_CLI=$SAFE_CLI_DIR/safe

export SAFE_CLI_BUILD=$PWD/sn_api/target/release/safe
export SAFE_AUTHD_BUILD=$PWD/sn_api/target/release/sn_authd
export SAFE_NODE_BUILD=$PWD/sn_node/target/release/sn_node

#env | grep SAFE_

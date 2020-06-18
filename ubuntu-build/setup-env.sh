#!/bin/bash
#
# Environment for other scripts
export SAFE_SCRIPTS_DIR=$PWD

export SAFE_CLI_DIR=$HOME/.safe/cli
export SAFE_AUTH_DIR=$HOME/.safe/authd
export SAFE_VAULT_DIR=$HOME/.safe/vault

export SAFE_CLI=$SAFE_CLI_DIR/safe

export SAFE_CLI_BUILD=$PWD/safe-api/target/release/safe
export SAFE_AUTHD_BUILD=$PWD/safe-api/target/release/safe-authd
export SAFE_VAULT_BUILD=$PWD/safe-vault/target/release/safe_vault

#env | grep SAFE_

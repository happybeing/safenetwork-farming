#!/bin/bash
source ./setup-env.sh
set -x

# TODO Test Client: Use SAFE CLI to test as client on (12/06/20) Baby Fleming shared single section (Odroid-U3+, Ubuntu 16.04 LTS / 18.04 LTS)
safe networks check
safe networks switch fleming-testnet
safe auth start
safe auth create --test-coins # Trying with sharedfleminghomevaults
safe auth unlock --self-auth


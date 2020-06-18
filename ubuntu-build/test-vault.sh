#!/bin/bash
source ./setup-env.sh
set -x

# Test Vault: Use SAFE CLI to test Vault on (12/06/20) Baby Fleming shared single section (Odroid-U3+, Ubuntu 16.04 LTS / 18.04 LTS)
# If this gives errors, see 'Setup Vault Config' above.
safe networks check
safe networks switch shared-section
safe vault join


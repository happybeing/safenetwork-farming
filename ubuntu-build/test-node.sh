#!/bin/bash
source ./setup-env.sh
set -x

# If this gives errors, see 'Setup node Config' above.
safe networks check
safe networks switch shared-section
safe node join


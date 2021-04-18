#!/bin/bash
source ./setup-env.sh
set -x

# Setup node Config
safe networks add fleming-testnet https://sn-node.s3.eu-west-2.amazonaws.com/config/node_connection_info.config


# If this gives errors, see 'Setup node Config' above.
safe networks check
safe networks switch fleming-testnet

echo "Starting your node (which will wait until accepted by the network)"
echo ""
echo "You can monitor your node by opening a terminal and typing:"
echo ""
echo "$ vdash ~/.safe/node/local-node/sn_node.log"
echo ""
echo "To stop your node, type:"
echo ""
echo "$ safe node killall"
safe node join

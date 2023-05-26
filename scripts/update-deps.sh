#!/bin/bash
#
# Update all git submodule dependenecies
#

set -e

(cd deps/furo && git pull origin main)
(cd deps/trade-executor && git pull origin master)
(cd deps/trade-executor/deps/trading-strategy && git pull origin master)
(cd deps/trade-executor/deps/web3-ethereum-defi && git pull origin master)
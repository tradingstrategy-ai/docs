#!/bin/bash
#
# Update all git submodule dependenecies
#

set -e

(cd deps/furo && git pull origin main)
(cd deps/trade-executor && git pull origin master)
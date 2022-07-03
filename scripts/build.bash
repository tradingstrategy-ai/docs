#!/bin/bash
#
# Build the sphinx documentation
#

git submodule update --init --recursive

poetry install


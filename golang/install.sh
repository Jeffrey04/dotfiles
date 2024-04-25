#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    brew install go

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    umake go
fi